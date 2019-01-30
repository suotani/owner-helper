class Owner::PostsController < OwnerController
  
  before_action :set_post, only: [:edit, :update, :destroy, :show]
  before_action :set_text, only: [:show]
  
  def index
    @posts = @owner.posts.order(updated_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to owner_posts_path, notice: "登録しました"
    else
      render :new
    end
  end
  
  def show
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
  
  def set_text
    @texts = @post.text.split("$end$").map do |part|
      paragraph = part.split("$$")
      info = paragraph[1].split(",")
      texts = paragraph[2].split
      [info[0], info[1], texts]
    end
  end
end
