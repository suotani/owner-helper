class Owner::ContactsController < OwnerController
  
  before_action :set_contact, only: [:edit, :update, :read]
  
  def index
    @contacts = @owner.contacts
                     .eager_load(:contact_chats)
                     .where.not(last_wrote_at: nil)
                     .order(:last_wrote_at)
  end
  
  def new
    house_ids = @owner.houses.ids
    house_id = params[:house_id]
    house_ids = house_id if house_id && house_ids.include?(house_id.to_i)
   
    @residents = Resident.joins(room: :house)
                         .merge(House.where(id: house_ids))
                         .moving_in
    @residents = @residents.where("residents.name LIKE ?", "%#{params[:name]}%") if params[:name].present?
    @residents = @residents.uniq
  end

  def edit
    @contact_chats = @contact.contact_chats.order(created_at: :desc).limit(20).reverse
  end
  
  def update
    raise "終了したチャットに対して送信が行われた" if !@contact.updatable?
    from_language = @owner.language
    to_language = @contact.resident.language || "ja"
    if from_language == to_language
      other_language_text = params[:chat_message]
    else
      other_language_text = ContactChat.text_translate(params[:chat_message], from_language, to_language)
    end
    contact_chat = ContactChat.new(
      contact_id: @contact.id,
      text: params[:chat_message],
      media: params[:media],
      other_language_text: other_language_text,
      owner_id: @owner.id
    )
    ActiveRecord::Base.transaction do
      contact_chat.save!
      @contact.update!(
        last_wrote_at: Time.zone.now,
        resident_status: Contact.resident_statuses[:resident_no_read]
      )
    end
    if contact_chat.contact.resident.contact_approval?
      ToResidentMailer.contact_update_mail(contact_chat).deliver_now
    end
    redirect_to edit_owner_contact_path(@contact.id) + "#last", notice: "送信しました"
    rescue => e
    logger.error(e.backtrace.join("\n"))
    redirect_to edit_owner_contact_path(@contact.id) + "#last", alert: "入力エラーがあります"
  end
  
  def read
    @contact.contact_chats.where(owner_id: nil).update_all(read_status: ContactChat.read_statuses[:read])
    @contact.update(owner_status: Contact.owner_statuses[:owner_read])
    head :no_content
  end
  
  private
  
  def set_contact
    @contact = @owner.contacts.eager_load(:contact_chats).find(params[:id])
  end
end
