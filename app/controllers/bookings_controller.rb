class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user # renter_id?
    if @booking.save
      redirect_to '/bookings'
    else
      render 'new'
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:date_start, :date_end, :boat_id)
  end
end
