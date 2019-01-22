class OwnerController < ApplicationController
  before_action :get_owner_instance
  before_action :authenticate_owner!
  layout "owner"


  private
  
  def get_owner_instance
    @owner = current_owner
  end
end