class Owner::RoomsController < OwnerController
    
  before_action :get_house
  before_action :get_room, only: [:edit, :update, :destroy]

  def create
    current_rooms_number = @house.rooms.size
    create_room_from_names
    created_rooms_number = @house.rooms.size
    redirect_to owner_house_path(@house.id)
  end
  
  def edit
  end
  
  def update
    if @room.update(room_params)
      redirect_to edit_owner_house_room_path(house_id: @house.id, id: @room.id)
    else
      render :edit
    end
  end
  
  def destroy
  end
 
 
  private
  
  def get_house
    @house = House.find(params[:house_id])
  end
  
  def get_room
    @room = Room.find(params[:id])
  end
  
  def room_params
    params.require(:room).permit(:number)
  end
  
  def create_room_from_names
    params[:rooms_name].split(",").each do |name|
      Room.create(number: name, house_id: @house.id)
    end
  end
end