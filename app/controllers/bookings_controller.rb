class BookingsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
  end
end
