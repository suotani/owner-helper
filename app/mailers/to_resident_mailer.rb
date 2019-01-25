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
end
