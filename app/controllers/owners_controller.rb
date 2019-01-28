class OwnersController < OwnerController

  def show
    @contacts = @owner.contacts.order(:last_wrote_at).limit(7)
  end
end
