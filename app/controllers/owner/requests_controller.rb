class Owner::RequestsController < OwnerController
  def index
    @request_rooms = Room.joins(:house).where(request: true).merge(House.where(owner_id: @owner.id))
  end

  def update
    p "request update"
    @request_rooms = []
    render :index
  end

  def destroy
    p "request destroy"
    @request_rooms = []
    render :index
  end
end
