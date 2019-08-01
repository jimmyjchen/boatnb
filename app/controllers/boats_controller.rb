class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = policy_scope(Boat).order(created_at: :desc).limit(6).geocoded
    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "/boats/info_window", locals: { boat: boat })
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    authorize @boat
    if @boat.save
      redirect_to @boat
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @boat.user = current_user
    if @boat.update(boat_params)
      redirect_to @boat
    else
      render :edit
    end
  end

  def destroy
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:description, :price, :available, :title, :photo, :photo_cache, :address)
  end

  def set_boat
    @boat = Boat.find(params[:id])
    authorize @boat
  end
end
