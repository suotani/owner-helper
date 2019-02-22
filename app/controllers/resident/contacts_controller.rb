class Resident::ContactsController < ResidentController

  def edit
    @contact = @resident.current_contact
    @contact_chats = @contact.contact_chats.order(created_at: :desc).limit(20).reverse
  end
  
  def update
    raise "終了したチャットに対して送信が行われた" if !@contact.updatable?
    from_language = @resident.language
    to_language = @contact.owner.language
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
      resident_id: @resident.id
    )
    ActiveRecord::Base.transaction do
      contact_chat.save!
      @contact.update!(
        last_wrote_at: Time.zone.now,
        owner_status: Contact.owner_statuses[:owner_no_read]
      )
    end
    if contact_chat.contact.owner.contact_mail_accept? && contact_chat.text.present?
      ToOwnerMailer.contact_update_mail(contact_chat).deliver_now
    end
    redirect_to edit_resident_contact_path(@contact.id), notice: "送信しました"
    rescue => e
    logger.error(e.backtrace.join("\n"))
    redirect_to edit_resident_contact_path(@contact.id), alert: "入力エラーがあります"
  end

  def read
    contact = @resident.current_contact
    contact.contact_chats.where(resident_id: nil).update_all(read_status: ContactChat.read_statuses[:read])
    contact.update(resident_status: Contact.resident_statuses[:resident_read])
    head :no_content
  end
  
end
