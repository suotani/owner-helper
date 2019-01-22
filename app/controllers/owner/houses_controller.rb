class Owner::HousesController < OwnerController
    
    before_action :get_house, only: [:show, :update, :destroy]
    layout "owner"
    
    def index
      @houses = @owner.houses
    end
    
    def new
      @house = House.new
    end
    
    def create
      @house = House.new(house_params)
      if @house.save
        redirect_to owner_house_path(@house.id), notice: "#{@house.name}を登録しました。"
      else
        render :new
      end
    end
    
    def show
    end
    
    def update
      if @house.update(house_params)
        redirect_to owner_house_path(@house.id)
      else
        render :show
      end
    end
    
    def destroy
    end
    
    private
    
    def house_params
      params.require(:house).permit(:name, :address, :postal_code).tap do |v|
        v[:owner_id] = current_owner.id
      end
    end
    
    def get_house
      @house = House.find(params[:id])
    end
end
