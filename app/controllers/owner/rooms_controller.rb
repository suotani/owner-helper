class Owner::RoomsController < OwnerController
    
  before_action :get_house
  before_action :get_room, only: [:edit, :update, :destroy, :remove]
  before_action :set_contact, only: [:edit]

  def create
    current_rooms_number = @house.rooms.size
    create_room_from_names
    created_rooms_number = @house.rooms.size
    redirect_to owner_house_path(@house.id)
  end
  
  def edit
  end
  
  def update
    if @room.update(room_params)
      redirect_to edit_owner_house_room_path(house_id: @house.id, id: @room.id)
    else
      set_contact
      render :edit
    end
  end
  
  def destroy
  end
  
  def remove
    ActiveRecord::Base.transaction do
      resident = @room.resident
      @room.update!(request: nil, resident_id: nil)
      resident.reload.update!(status: Resident.statuses[:signed_up])
      ToResidentMailer.leave_mail(resident, @onwer).deliver_now
    end
    redirect_to edit_owner_house_room_path(house_id: @house.id, id: @room.id), notice: "退去処理を完了しました"
    rescue => e
    logger.error(e)
    redirect_to edit_owner_house_room_path(house_id: @house.id, id: @room.id), alert: "エラーが発生し、処理が中断されました。"
  end
 
 
  private
  
  def get_house
    @house = House.find(params[:house_id])
  end
  
  def get_room
    @room = Room.find(params[:id])
  end
  
  def set_contact
    @contact = Contact.where(owner_id: @owner.id, resident_id: @room.resident_id).first
  end
  
  def room_params
    params.require(:room).permit(:number)
  end
  
  def create_room_from_names
    params[:rooms_name].split(",").each do |name|
      Room.create(number: name, house_id: @house.id)
    end
  end
end