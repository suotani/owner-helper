module ControllerMacros
  def login_owner(owner)
    @request.env["devise.mapping"] = Devise.mappings[:owner]
    sign_in owner
  end

  def login_resident(resident)
    controller.stub(:authenticate_user!).and_return true
    @request.env["devise.mapping"] = Devise.mappings[:resident]
    sign_in resident
  end
end