class Owner::InquiriesController < OwnerController

  def new
    @inquiry = Inquiry.new(email: @owner.email)
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      redirect_to owner_path, notice: "お問い合わせを送信しました。返信まで少々お待ちください。"
    else
      @errors = @inquiry.errors.full_messages
      render :new
    end
  end
  
  private
  
  def inquiry_params
    params.require(:inquiry).permit(:text, :email, :category).tap do |v|
      v[:owner_id] = @owner.id
    end
  end
end