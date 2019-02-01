class OwnersController < OwnerController

  def show
    @contacts = @owner.contacts.order(:last_wrote_at).limit(7)
    @posts = @owner.posts
                   .where("post_at < ?", Time.zone.now)
                   .order(post_at: :desc)
                   .limit(5)
  end
end
