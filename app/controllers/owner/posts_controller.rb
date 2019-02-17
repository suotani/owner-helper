class Owner::PostsController < OwnerController
  
  before_action :set_post, only: [:edit, :update, :destroy, :show, :read_status]
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
  
  def houses
    @houses = @owner.houses
  end

  def new
    @post = Post.new
    @house_ids = params[:ids].join(",")
  end

  def create
    @post = Post.new(post_params)
    @house_ids = params[:house_ids]
    house_ids = params[:house_ids].split(",").map(&:to_i)
    house_ids = @owner.houses.ids & house_ids
    ActiveRecord::Base.transaction do
      @post.save!
      @post.reload
      house_ids.each do |house_id|
        PostHouse.create!(house_id: house_id, post_id: @post.id)
        residents = Resident.joins(room: :house).moving_in.merge(House.where(id: house_id))
        residents.each do |resident|
          PostResident.create!(post_id: @post.id, resident_id: resident.id)
        end
      end
    end
    redirect_to owner_posts_path, notice: "登録しました"
    rescue
    set_text
    @errors = @post.errors.full_messages
    render :new
  end
  
  def show
  end

  def edit
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
  
  def post_params
    params.require(:post).permit(:text, :title, :post_at).tap do |v|
      v[:owner_id] = @owner.id
      v[:post_at] = Time.zone.parse(v[:post_at])
    end
  end
  
  def set_text
    @texts = @post.text.split("$end$").map do |part|
      paragraph = part.split("$$")
      info = paragraph[1].split(",")
      texts = paragraph[2].split(/\r\n|\n|\r/)
      [info[0], info[1], texts]
    end
  end
  
  def text_translation(target)
    translated = ""
    @post.text.split("$end$").map do |part|
      paragraph = part.split("$$")
      info = paragraph[1]
      texts = paragraph[2]
      translated_text = Post.text_translation(texts, "ja", target)
      translated += "$$#{info}$$#{translated_text}$end$"
    end
  end
end
