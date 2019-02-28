class Owner::InvoicesController < OwnerController
  protect_from_forgery :except => [:create]
  
  def index
    @bills = @owner.bills.order(:created_at)
  end

  def create
    begin
    Payment.add_card(@owner.pay_customer_id, params[:token])
    @owner.update(pay_token: params[:token])
    redirect_to owner_invoices_path, notice: "カードを登録しました。"
    end
    rescue
    @errors = @owner.errors.full_messages
    render :index
  end

  def show
    @bill = @owner.bills.eager_load(:bill_details).find(params[:id])
  end
end
