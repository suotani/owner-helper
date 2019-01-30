class Owner::PostsController < OwnerController
  
  before_action :set_post, only: [:edit, :update, :destroy]
  def index
    @posts = @owner.posts.order(updated_at: :desc)
  end

  def new
    @post = Post.new
  end

  def cerate
    @post = Post.new(post_params)
    if @post.save
      redirect_to owner_posts_path, notice: "登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:text, :title, :post_at).tap do |v|
      v[:owner_id] = @owner.id
      v[:post_at] = v[:post_at].to_datetime
    end
  end
end
