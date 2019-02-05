class OwnersController < OwnerController

  def show
    @contacts = @owner.contacts.order(:last_wrote_at).limit(7)
    @posts = @owner.posts
                   .where("post_at < ?", Time.zone.now)
                   .order(post_at: :desc)
                   .limit(5)
  end
  
  def edit
  end
  
  def update
    if @owner.update(owner_params)
      redirect_to owner_setting_path, notice: "更新しました"
    else
      @errors = @owner.errors.full_messages
      render :edit
    end
  end
  
  def owner_params
    params.require(:owner).permit(:name, :phone_number, :contact_mail_setting, :request_mail_setting)
  end
end
