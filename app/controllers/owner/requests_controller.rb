class Owner::RequestsController < OwnerController
  
  before_action :get_room, only: [:update, :destroy]
  
  def index
    @request_rooms = Room.joins(:house).where(request: true).merge(House.where(owner_id: @owner.id))
  end

  def update
    resident = @room.resident
    ActiveRecord::Base.transaction do
      resident.update(status: Resident.statuses[:moving_in])
      contact = Contact.create!(resident_id: resident.id, owner_id: @owner.id, room_id: @room.id)
      @room.update!(
        request: false,
        contact_id: contact.id,
        moved_at: Time.zone.now,
        leave_at: nil,
        resident_name: resident.name,
        resident_name_kana: resident.name_kana,
        resident_phone_number: resident.phone_number
      )
      bill_detail = @room.house.current_bill_detail
      bill_detail.update(new_moving_count: bill_detail.new_moving_count + 1)
      @room.house.posts.each do |post|
        PostResident.create!(post_id: post.id, resident_id: resident.id)
      end
    end
    ToResidentMailer.request_accept_mail(resident).deliver_now
    redirect_to owner_requests_path, notice: "#{resident.name}さんの申請を許可しました"
  end

  def destroy
    resident = @room.resident
    ActiveRecord::Base.transaction do
      resident.update(status: Resident.statuses[:signed_up])
      @room.update(request: false, resident_id: nil)
    end
    ToResidentMailer.request_reject_mail(resident).deliver_now
    redirect_to owner_requests_path, notice: "#{resident.name}さんの申請を却下しました"
  end

  private
  
  def get_room
    @room = Room.find(params[:id])
  end
end
