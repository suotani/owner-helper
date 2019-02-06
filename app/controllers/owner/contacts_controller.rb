class Owner::ContactsController < OwnerController
  
  before_action :set_contact, only: [:edit, :update]
  
  def index
    @contacts = @owner.contacts
                     .eager_load(:contact_chats)
                     .where.not(last_wrote_at: nil)
                     .order(:last_wrote_at)
  end

  def edit
    @contact_chats = @contact.contact_chats.order(created_at: :desc).limit(20).reverse
    @contact.update(owner_status: Contact.owner_statuses[:owner_read])
  end
  
  def update
    contact_chat = ContactChat.new(
      contact_id: @contact.id,
      text: params[:chat_message],
      owner_id: @owner.id,
      readFlg: false
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
    rescue
    redirect_to edit_owner_contact_path(@contact.id) + "#last", alert: "入力エラーがあります"
  end
  
  private
  
  def set_contact
    @contact = @owner.contacts.eager_load(:contact_chats).find(params[:id])
  end
end
