class ReviewsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @booking.review = @review
    authorize @booking
    if @review.save
      redirect_to history_path
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
