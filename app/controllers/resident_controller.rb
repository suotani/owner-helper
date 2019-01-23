class ResidentController < ApplicationController
  before_action :get_resident_instance
  before_action :authenticate_resident!
  before_action :status_redirect
  layout "resident"

  private
  
  def get_resident_instance
    @resident = current_resident
  end
  
  def status_redirect
    if @resident.signed_up?
      redirect_to new_resident_house_path
    elsif @resident.requested?
      redirect_to resident_house_path(@resident.room.house.id)
    end
  end
end
