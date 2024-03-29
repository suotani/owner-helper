# frozen_string_literal: true

class Residents::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
    
  before_action :set_language
  layout "resident"
  
  def after_sign_in_path_for(resource)
    resident_path
  end

  def after_sign_out_path_for(resource)
    new_resident_session_path
  end

  # GET /resource/sign_in
  def new
    @email = params[:email]
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def set_language
    if params[:locale].present?
      I18n.locale = params[:locale]
    else
      I18n.locale = "ja"
    end
    @locale = I18n.locale
  end
end
