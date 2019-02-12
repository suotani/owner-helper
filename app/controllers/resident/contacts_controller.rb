class Resident::ContactsController < ResidentController

  def edit
    @contact = @resident.current_contact
    @contact_chats = @contact.contact_chats.order(created_at: :desc).limit(20).reverse
  end
  
  def update
    contact_chat = ContactChat.new(
      contact_id: @contact.id,
      text: params[:chat_message],
      resident_id: @resident.id
    )
    ActiveRecord::Base.transaction do
      contact_chat.save!
      @contact.update!(
        last_wrote_at: Time.zone.now,
        owner_status: Contact.owner_statuses[:owner_no_read]
      )
    end
    if contact_chat.contact.owner.contact_mail_accept?
      ToOwnerMailer.contact_update_mail(contact_chat).deliver_now
    end
    redirect_to edit_resident_contact_path(@contact.id)+"#last", notice: "送信しました"
    rescue => e
    logger.error(e)
    redirect_to edit_resident_contact_path(@contact.id)+"#last", alert: "入力エラーがあります"
  end

  def read
    contact = @resident.current_contact
    contact.contact_chats.where(resident_id: nil).update_all(read_status: ContactChat.read_statuses[:read])
    contact.update(resident_status: Contact.resident_statuses[:resident_read])
    head :no_content
  end
  
end
