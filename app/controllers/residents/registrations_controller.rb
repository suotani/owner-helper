# frozen_string_literal: true

class Residents::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :before_service_start
  before_action :set_language
  # before_action :configure_account_update_params, only: [:update]
  layout "resident"
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :family, :language, :attribute])
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
    new_resident_session_path
  end
  
  def before_service_start
    if Time.zone.today < Time.zone.parse("2019/03/01")
      redirect_to root_path, error: "３月１日よりサービス正式リリースとなります。"
    end
  end
  
  def set_language
    if params[:locale].present?
      I18n.locale = params[:locale]
    else
      I18n.locale = "ja"
    end
    @locale = I18n.locale
  end
end
