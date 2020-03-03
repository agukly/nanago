class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_bookings
    @bookings = current_user.bookings
  end


  def my_reviews
  end


  def my_prams
  end
end
