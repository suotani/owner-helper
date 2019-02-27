class Owner::RoomResidentsController < OwnerController

  def update
    @room = Room.where(house_id: @owner.houses.ids).find(params[:id])
    @result = @room.update(room_params)
  end
  
  private
  
  def room_params
    params.require(:room).permit(:number, :resident_name, :resident_name_kana, :resident_phone_number).tap do |v|
      if v[:resident_name].blank?
        v[:resident_name] = nil
        v[:resident_name_kana] = nil
        v[:resident_phone_number] = nil
      end
    end
  end
end