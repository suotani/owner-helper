class OwnersController < OwnerController

  def show
    @contacts = @owner.contacts.order(:updated_at).limit(7)
  end
end
