class ToOwnerMailer < ApplicationMailer
    
    def contact_update_mail(chat)
      @chat = chat
      @owner = chat.contact.owner
      @resident = chat.contact.resident
        mail(
          subject: "【#{OwnerHelper::Application::SERVICE_NAME}】新着メッセージが届きました", #メールのタイトル,
          to: @owner.email #宛先
        )
    end
    
    def request_mail(room, resident)
      @room = room
      @owner = room.house.owner
      @resident = resident
        mail(
          subject: "【#{OwnerHelper::Application::SERVICE_NAME}】入居申請が届きました", #メールのタイトル,
          to: @owner.email #宛先
        )
    end
end
