class OwnerController < ApplicationController
  before_action :authenticate_owner!
  before_action :get_owner_instance
  layout "owner"

  private
  
  def get_owner_instance
    @owner = current_owner
    @request_count = Room.joins(:house).where(request: true).merge(House.where(owner_id: @owner.id)).count
    @new_message_count = Contact.owner_no_read.count
  end
end