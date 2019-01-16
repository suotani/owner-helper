class OwnerController < ApplicationController
  before_action :get_owner_instance
  layout "owner"


  private
  
  def get_owner_instance
    @owner = current_owner
  end
end