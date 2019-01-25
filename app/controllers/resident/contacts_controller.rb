class Resident::ContactsController < ResidentController
  def index
    @contacts = @resident.contacts.order(:updated_at)
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def update
  end
end
