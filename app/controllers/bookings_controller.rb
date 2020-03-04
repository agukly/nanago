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

    @markers = [@booking.pram].map do |pram|
      {
        lat: pram.latitude,
        lng: pram.longitude,
        #infoWindow: render_to_string(partial: "info_window", locals: { pram: pram })
      }
    end
     #authorize @review -- no review policy yet
  end

end
