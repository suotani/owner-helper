class ResidentController < ApplicationController
  before_action :get_resident_instance
  before_action :authenticate_resident!
  layout "resident"

  private
  
  def get_resident_instance
    @resident = current_resident
  end
end
