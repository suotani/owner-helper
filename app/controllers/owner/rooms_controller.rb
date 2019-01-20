class Owner::RoomsController < OwnerController
    
  before_action :get_house

  def create
    current_rooms_number = @house.rooms.size
    create_room_from_names
    created_rooms_number = @house.rooms.size
    redirect_to owner_house_path(@house.id), notice: "#{created_rooms_number - current_rooms_number}部屋登録しました"
  end
  
  def edit
  end
  
  def update
  end
 
 
  private
  
  def get_house
    @house = House.find(params[:house_id])
  end
  
  def create_room_from_names
    params[:rooms_name].split(",").each do |name|
      Room.create(number: name, house_id: @house.id)
    end
  end
end