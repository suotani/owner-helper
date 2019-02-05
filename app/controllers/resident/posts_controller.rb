class Resident::PostsController < ResidentController
  def index
    @posts = @resident.room.house.posts
                      .where("post_at < ?", Time.zone.now)
    @posts = @posts.where("title like ?", "%#{params[:title]}%") if params[:title].present?
    @posts = @posts.order(post_at: :desc)
  end
  
  def show
    @post = @resident.room.house.posts
                      .where("post_at < ?", Time.zone.now)
                      .where(id: params[:id])
                      .first
    @texts = @post.text.split("$end$").map do |part|
      paragraph = part.split("$$")
      info = paragraph[1].split(",")
      texts = paragraph[2].split
      [info[0], info[1], texts]
    end
  end

end
