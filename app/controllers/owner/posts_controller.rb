class Owner::PostsController < OwnerController
  def index
    @posts = @owner.posts.order(updated_at: :desc)
  end

  def new
    @post = Post.new
  end

  def cerate
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
