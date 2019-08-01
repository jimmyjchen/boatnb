class BookingsController < ApplicationController
  def index
    @boats = policy_scope(Boat).where(user: current_user).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    authorize @booking
    @boat = Boat.find(params[:boat_id])
  end

  def create
    @booking = Booking.new(params_booking)
    @boat = Boat.find(params[:boat_id])
    @booking.user = current_user
    @booking.boat = @boat
    authorize @booking
    if @booking.save
      redirect_to '/bookings/history'
    else
      render 'new'
    end
  end

  def history
    @bookings = Booking.where(user: current_user)
    authorize @bookings
  end

  private

  def params_booking
    params.require(:booking).permit(:date_start, :date_end, :boat_id)
  end
end
