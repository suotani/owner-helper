class Owner::ContactsController < OwnerController
  
  before_action :set_contact, only: [:edit, :update]
  
  def index
    @contacts = Owner.contacts.eager_load(:contact_chats).order(:updated_at)
  end

  def edit
    @contact_chats = @contact.contact_chats.order(:created_at)
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
