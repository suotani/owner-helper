class Owner::PhoneListsController < OwnerController

  def index
    houses = @owner.houses
    houses = houses.where(id: params[:house_id]) if params[:house_id].present?
    @rooms = Room.eager_load(:house).where(house_id: houses.ids).where.not(resident_name: nil)
    @rooms = @rooms.where(number: params[:room_number]) if params[:room_number].present?
    if params[:name]
      @rooms = @rooms.where("resident_name LIKE ?", "%#{params[:name]}%")
                     .or(@rooms.where("resident_name_kana LIKE ?", "%#{params[:name]}%"))
    end
    @rooms = @rooms.order(:resident_name_kana)
    @rooms = @rooms.uniq
  end

  def show
  end
end
