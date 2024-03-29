# frozen_string_literal: true

class Owners::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  layout "owner"
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    # slack通知
    c = Payment.create_customer(resource.email, resource.name)
    resource.update(pay_customer_id: c.id)
    notifier = Slack::Notifier.new(Rails.application.config.slack_webhook_url)
    notifier.ping("新しく管理人が登録されました！")
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  
  def invitation_owner
    code = params[:invitation_code]
    @invitation_owner = Owner.get_invitation_owner(code)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :invitation_code, :invitation_owner_id, :attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    new_owner_session_path
  end
end
