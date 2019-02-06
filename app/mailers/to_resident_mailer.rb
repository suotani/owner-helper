class ToResidentMailer < ApplicationMailer
    
    def request_accept_mail(resident)
      @resident = resident
        mail(
          subject: "入居リクエストが受諾されました。", #メールのタイトル,
          to: resident.email #宛先
        )
    end
    
    def request_reject_mail(resident)
      @resident = resident
        mail(
          subject: "入居リクエストが拒否されました。", #メールのタイトル,
          to: resident.email #宛先
        )
    end

    def contact_update_mail(chat)
      @chat = chat
      @owner = chat.contact.owner
      @resident = chat.contact.resident
        mail(
          subject: "新着メッセージが届きました", #メールのタイトル,
          to: @resident.email #宛先
        )
    end
end
