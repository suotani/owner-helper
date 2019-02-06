class Resident::ContactsController < ResidentController

  def edit
    @contact = @resident.current_contact
    @contact_chats = @contact.contact_chats.order(created_at: :desc).limit(20).reverse
    @contact.update(resident_status: Contact.resident_statuses[:resident_read])
  end
  
  def update
    contact_chat = ContactChat.new(
      contact_id: @contact.id,
      text: params[:chat_message],
      resident_id: @resident.id,
      readFlg: false
    )
    ActiveRecord::Base.transaction do
      contact_chat.save!
      @contact.update!(
        last_wrote_at: Time.zone.now,
        owner_status: Contact.owner_statuses[:owner_no_read]
      )
    end
    ToOwnerMailer.contact_update_mail(contact_chat).deliver_now
    redirect_to edit_resident_contact_path(@contact.id)+"#last", notice: "送信しました"
    rescue
    redirect_to edit_resident_contact_path(@contact.id)+"#last", alert: "入力エラーがあります"
  end
  
end
