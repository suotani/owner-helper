class StaticsController < ApplicationController
    layout 'static'
  def index
  end
  
  def inquiry
    name = params[:name]
    email = params[:email]
    text = params[:text]
    ToAdminMailer.inquiry_from_guest_mail(name, email, text).deliver_now
    rescue => e
    logger.error(e)
  end
  
  def select_user
  end
  
  def privacy
  end
  
  def post_sample
  end
  
  def flyer
    render layout: "application"
  end
end
