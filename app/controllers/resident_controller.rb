class ResidentController < ApplicationController

  before_action :authenticate_resident!
  before_action :get_resident_instance
  before_action :set_content
  before_action :status_redirect
  before_action :set_locale
  layout "resident"

  private
  
  def set_locale
    I18n.locale = locale
  end
  
  def locale
    @locale = @resident.language ||= I18n.default_locale
  end
  
  def get_resident_instance
    @resident = current_resident
    @no_read_post_count = @resident.post_residents
                                   .yet
                                   .joins(:post)
                                   .merge(Post.where("post_at < ?", Time.zone.now))
                                   .count
  end
  
  def status_redirect
    if @resident.signed_up?
      redirect_to new_resident_house_path
    elsif @resident.requested?
      redirect_to resident_path
    end
  end
  
  def set_content
    if @resident.moving_in?
      @contact = @resident.room.contact
    end
  end
end
