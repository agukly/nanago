class PramsController < ApplicationController
  before_action :set_pram, only: [:show, :destroy]

   def index

    if params[:query]
      @prams = policy_scope(Pram).search_by_brand_and_model_and_location(params[:query])
    else
      @prams = policy_scope(Pram).select { |pram| pram.latitude != nil && pram.longitude != nil }
    end

    @markers = @prams.map do |pram|
      {
        lat: pram.latitude,
        lng: pram.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pram: pram })
      }
    end
  end

  def show
    @booking = Booking.new
    authorize @pram

       @markers =
      [{
        lat: @pram.latitude,
        lng: @pram.longitude,
        # infoWindow: render_to_string(partial: "info_window", locals: { pram: pram })
      }]


  end

  def new
    @pram = Pram.new
    authorize @pram
  end

  def create
    @pram = Pram.new(pram_params)
    @pram.user = current_user
    authorize @pram
    if @pram.save
      redirect_to @pram, notice: 'Pram was successfully created.'
    else
      render :new
    end
  end

  def destroy
    authorize @pram
    @pram.destroy
    redirect_to prams_path, notice: 'Pram was successfully deleted.'
  end

  private

  def set_pram
    @pram = Pram.find(params[:id])
  end

  def pram_params
    params.require(:pram).permit(:brand, :model, :location, :year, :description, :price, photos: [])
  end
end
