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
    if @resident.update(resident_params)
      redirect_to resident_setting_path, notice: "更新しました"
    else
      @errors = @resident.errors.full_messages
      render :edit
    end
  end
  
  private
  
  def status_redirect
    if @resident.signed_up?
      redirect_to new_resident_house_path
    end
  end
  
  def resident_params
    params.require(:resident).permit(:name, :phone_number, :family, :post_mail_setting, :contact_mail_setting)
  end
end
