class ResidentsController < ResidentController


  def show
    if @resident.moving_in?
      # todo: お知らせ
      @posts = @resident.room.house.posts
                        .where("post_at < ?", Time.zone.now)
                        .order(post_at: :desc)
                        .limit(5)
    end
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def status_redirect
    if @resident.signed_up?
      redirect_to new_resident_house_path
    end
  end
end
