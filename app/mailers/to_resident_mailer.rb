class ToResidentMailer < ApplicationMailer
    
    def request_accept_mail(resident)
      @resident = resident
        mail(
          subject: "【#{OwnerHelper::Application::SERVICE_NAME}】入居リクエストが受諾されました。", #メールのタイトル,
          to: resident.email #宛先
        )
    end
    
    def request_reject_mail(resident)
      @resident = resident
        mail(
          subject: "【#{OwnerHelper::Application::SERVICE_NAME}】入居リクエストが拒否されました。", #メールのタイトル,
          to: resident.email #宛先
        )
    end

    def contact_update_mail(chat)
      @chat = chat
      @owner = chat.contact.owner
      @resident = chat.contact.resident
        mail(
          subject: "【#{OwnerHelper::Application::SERVICE_NAME}】新着メッセージが届きました", #メールのタイトル,
          to: @resident.email #宛先
        )
    end
    
    def leave_mail(resident, owner)
      @resident = resident
      @owner = owner
        mail(
          subject: "【#{OwnerHelper::Application::SERVICE_NAME}】ご利用いただきありがとうございました。", #メールのタイトル,
          to: @resident.email #宛先
        )
    end
    
    def post_reached_mail(resident, post, foreign_post)
      @resident = resident
      @post = post
      @foreign_post = foreign_post
        mail(
          subject: "【#{OwnerHelper::Application::SERVICE_NAME}】お知らせが投稿されました。", #メールのタイトル,
          to: @resident.email #宛先
        )
    end
end
