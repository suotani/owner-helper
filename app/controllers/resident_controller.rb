class ResidentController < ApplicationController

  before_action :authenticate_resident!
  before_action :get_resident_instance
  before_action :set_content
  before_action :status_redirect
  layout "resident"

  private
  
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
      @contact = @resident.contacts.where(room_id: @resident.room.id).first
    end
  end
end
