class Owner::ResidentsController < OwnerController

  def index
    house_ids = @owner.houses.ids
    if params[:house_id] && house_ids.include?(params[:house_id].to_i)
      house_ids = params[:house_id]
    end
   
    @residents = Resident.joins(room: :house)
                         .merge(House.where(id: house_ids))
    @residents = @residents.where("residents.name LIKE ?", "%#{params[:name]}%")if params[:name].present?
    @residents = @residents.uniq
  end
end