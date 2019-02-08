class StaticsController < ApplicationController
    layout 'static'
  def index
  end
  
  def inquiry
    name = params[:name]
    email = params[:email]
    text = params[:text]
    ToAdminMailer.inquiry_from_guest_mail(name, email, text).deliver_now
  end
  
  def privacy
  end
end
