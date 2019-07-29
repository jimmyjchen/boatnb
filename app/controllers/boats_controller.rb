class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :destroy]
  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
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
    if @boat.update(boat_params)
      redirect_to @boat
    else
      render :edit
    end
  end

  def destroy
    @boat.destroy
    redirect_to current_user
  end

  private

  def boat_params
    params.require(:boat).permit(:description, :price, :available, :title)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end
