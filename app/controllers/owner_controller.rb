class OwnerController < ApplicationController
  before_action :get_owner_instance
  before_action :authenticate_owner!
  layout "owner"


  private
  
  def get_owner_instance
    @owner = current_owner
    @request_count = Room.joins(:house).where(request: true).merge(House.where(owner_id: @owner.id)).count
  end
end