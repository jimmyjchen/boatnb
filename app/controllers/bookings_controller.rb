class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
  end

  def create
    @booking = Booking.new(params_booking)
    @boat = Boat.find(params[:boat_id])
    @booking.user = current_user
    @booking.boat = @boat
    if @booking.save
      redirect_to '/bookings'
    else
      render 'new'
    end
  end

  def history
    @bookings = Booking.where(user: current_user)
  end

  private

  def params_booking
    params.require(:booking).permit(:date_start, :date_end, :boat_id)
  end
end
