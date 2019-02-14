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
                      .find(params[:id])
    @texts = @post.text.split("$end$").map do |part|
      paragraph = part.split("$$")
      info = paragraph[1].split(",")
      texts = paragraph[2].split("\n")
      [info[0], info[1], texts]
    end
  end
  
  def read
    post_resident = @resident.post_residents.where(post_id: params[:id]).first
    post_resident.update(read_status: PostResident.read_statuses[:read])
    head :no_content
  end

end
