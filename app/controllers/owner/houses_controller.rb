class Owner::HousesController < OwnerController
    
    before_action :authenticate_owner!
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
      @house = House.find(params[:id])
    end
    
    def edit
        
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def house_params
      params.require(:house).permit(:name, :address).tap do |v|
        v[:owner_id] = current_owner.id
      end
    end
end
