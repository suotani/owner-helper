class Owner::ResidentsController < OwnerController

  def index
    house_ids = @owner.houses.ids
    @residents = Resident.joins(room: :house).merge(House.where(id: house_ids)).uniq
  end
end