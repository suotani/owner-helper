class Owner::ResidentsController < OwnerController

  def index
    @residents = Resident.joins(room: :house).merge(House.where(id: @owner.houses.ids)).uniq
  end
end