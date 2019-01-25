class Owner::ResidentsController < OwnerController

  def index
    house_ids = @owner.houses.ids
    @residents = Resident.joins(room: :house).merge(House.where(id: @owner.houses.ids))
    if params[:name].present?
      @residents = @residents.where("residents.name LIKE ?", "%#{params[:name]}%")
      @name = params[:name]
    else
      @name = ""
    end
    @residents = @residents.uniq
  end
end