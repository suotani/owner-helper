class Owner::PostsController < OwnerController
  
  before_action :set_post, only: [:edit, :update, :destroy, :show, :read_status, :setting, :update_setting]
  before_action :set_text, only: [:show, :edit]
  
  def index
    @posts = @owner.posts
    @posts = @posts.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @posts = if params[:status].present? && params[:status] == "posted"
               @posts.where("post_at < ?", Time.zone.now)
             elsif params[:status].present? && params[:status] == "no_post"
               @posts.where("post_at > ?", Time.zone.now)
             else
               @posts
             end
    @posts = @posts.order(updated_at: :desc)
  end

  def new
    @houses = @owner.houses
    @house_ids = []
    @post = Post.new
  end

  def create
    @post = Post.new(post_setting_params)
    @house_ids = params[:ids].map(&:to_i)
    @house_ids = @owner.houses.ids & @house_ids
    ActiveRecord::Base.transaction do
      @post.save!
      @house_ids.each do |house_id|
        PostHouse.create!(house_id: house_id, post_id: @post.id)
      end
    end
    @post.reload
    redirect_to edit_owner_post_path(@post.id)
    rescue
    @houses = @owner.houses
    @errors = @post.errors.full_messages
    render :new
  end
  
  def show
  end

  def edit
    render layout: "application"
  end

  def update
    
    if @post.update(post_params)
      redirect_to edit_owner_post_path(@post.id), notice: "保存しました"
    else
      set_text
      @errors = @post.errors.full_messages
      render :edit
    end
  end
  
  def setting
    @houses = @owner.houses
    @house_ids = @post.houses.ids
    render :new
  end
  
  def update_setting
    @house_ids = params[:ids].map(&:to_i)
    @house_ids = @owner.houses.ids & @house_ids
    ActiveRecord::Base.transaction do
      @post.update!(post_setting_params(@post.text))
      unless @post.houses.ids.sort == @house_ids.sort
        @post.post_houses.destroy_all
        @house_ids.each do |house_id|
          PostHouse.create!(house_id: house_id, post_id: @post.id)
        end
      end
      redirect_to setting_owner_post_path(@post.id), notice: "更新しました"
    end
    rescue
    @errors = @post.errors.full_messages
    render :new
  end

  def destroy
  end
  
  def read_status
    @house_read_statuses = []
    post_residents = @post.post_residents.joins(resident: [room: :house])
    @post.houses.each do |house|
      post_residents_in_house = post_residents.merge(House.where(id: house.id))
      if post_residents_in_house.present?
        @house_read_statuses += [
          {
            house: house,
            post_residents: post_residents_in_house
          }
        ]
      end
    end
  end
  
  private
  
  def set_post
    @post = @owner.posts.where(id: params[:id]).first
  end
  
  def post_setting_params(text = "")
    params.require(:post).permit(:title, :post_at, :end_option).tap do |v|
      v[:owner_id] = @owner.id
      v[:post_at] = Time.zone.parse(v[:post_at])
      v[:end_at] = Post.calc_end_at(v[:post_at], v[:end_option])
      v[:end_option] = v[:end_option].to_i
      v[:text] = text
    end
  end
  
  def post_params
    params.require(:post).permit(:text)
  end
  
  def set_text
    @texts = @post.text.split("$end$").map do |part|
      paragraph = part.split("$$")
      info = paragraph[1].split(",")
      texts = paragraph[2].split(/\r\n|\n|\r/)
      [info[0], info[1], texts]
    end
  end
end
