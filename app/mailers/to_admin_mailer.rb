class ToAdminMailer < ApplicationMailer
    
    def owner_registration_mail
    end
    
    def resident_registration_mail
    end
    
    def inquiry_from_guest_mail(name, email, text)
      @name = name
      @email = email
      @text = text
        mail(
          subject: "【#{OwnerHelper::Application::SERVICE_NAME}】お問い合わせが届きました", #メールのタイトル,
          to: "s.uotani.zetakansu@gmail.com" #宛先
        )
    end
end
