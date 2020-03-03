class BookingsController < ApplicationController
  def index
  end

  def new

  end

  def create
    @booking.user = current_user
  end

  def show
    @pram = Pram.new
    @booking = Booking.find(params[:id])
    @review = Review.new
    authorize @booking
     #authorize @review -- no review policy yet
  end

end
