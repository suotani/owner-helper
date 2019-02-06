class ToOwnerMailer < ApplicationMailer
    
    def contact_update_mail(chat)
      @chat = chat
      @owner = chat.contact.owner
      @resident = chat.contact.resident
        mail(
          subject: "新着メッセージが届きました", #メールのタイトル,
          to: @owner.email #宛先
        )
    end
end
