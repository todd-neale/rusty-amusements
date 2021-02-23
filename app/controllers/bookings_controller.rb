class BookingsController < ApplicationController
  def create
    @booking = Booking.new booking_params
    @booking.amusement = Amusement.find(params[:amusement_id])
    @booking.user = current_user
    if @booking.save
      # this should be changed to redirect to user profile page
      redirect_to amusement_path(@booking.amusement)
    else
      # both hsould have some kind of alert/modal, to let them know of their success/failure
      redirect_to amusement_path(@booking.amusement)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
