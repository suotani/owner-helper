class ResidentsController < ResidentController

  def show
  end
  
  private
  
  def status_redirect
    if @resident.signed_up?
      redirect_to new_resident_house_path
    end
  end
end
