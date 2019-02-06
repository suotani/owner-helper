class Resident::HousesController < ApplicationController
  before_action :get_resident_instance
  before_action :authenticate_resident!
  before_action :moving_in_redirect
  before_action :requested_redirect, only: [:new, :create]
  layout "resident"
    
  def new
    if params[:search_name]
      session[:search_house_from_name] = params[:search_name]
      @houses = House.where("name LIKE ?", "%#{params[:search_name]}%")
    else
      @houses = House.all
    end
  end
  
  def create
    house = House.find(params[:house_id])
    owner = house.owner
    room = house.rooms.where(number: params[:number]).first
    if room && room.resident.blank?
      ActiveRecord::Base.transaction do
        room.update!(resident_id: @resident.id, request: true, requested_at: Time.zone.now)
        @resident.update!(status: ::Resident.statuses[:requested])
      end
      if owner.mail_accept?
        ToOwnerMailer.request_mail(room, @resident).deliver_now
      end
      redirect_to resident_path
    else
      search_house(session[:search_house_from_name])
      @errors = ["存在しない部屋番号が指定されました。"]
      render :new
    end
    rescue
    redirect_to resident_path
  end
  
  private
  
  def moving_in_redirect
    if @resident.moving_in?
      redirect_to resident_path
    end
  end
  
  def requested_redirect
    if @resident.requested?
      redirect_to resident_path
    end
  end

  def get_resident_instance
    @resident = current_resident
  end
  
  def search_house(search_name)
    if search_name
      session[:search_house_from_name] = search_name
      @houses = House.where("name LIKE ?", "%#{params[:search_name]}%")
    else
      @houses = House.all
    end
  end
end