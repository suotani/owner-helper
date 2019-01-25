class Owner::ContactsController < OwnerController
  
  before_action :set_contact, only: [:show, :update]
  
  def index
    @contacts = Owner.contacts.order(:updated_at)
  end

  def show
  end
  
  def update
    contact_chat = ContactChat.new(contact_id: @contact.id, text: params[:text])
    ActiveRecord::Base.transaction do
      contact_chat.save
      @contact.update(updated_at: Time.zone.now)
    end
    
  end
  
  private
  
  def set_contact
    @contact = Contact.eager_load(:contact_chats).find(params[:id])
  end
end
