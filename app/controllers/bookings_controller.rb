class BookingsController < ApplicationController
  def create
    @booking = Booking.new booking_params
    @booking.amusement = Amusement.find(params[:amusement_id])
    @booking.user = current_user
    if @booking.save
      # this should be changed to redirect to user profile page
      redirect_to user_path(current_user), notice: "Booking request sent to dangerous carnie."
    else
      # both hsould have some kind of alert/modal, to let them know of their success/failure
      redirect_to amusement_path(@booking.amusement), notice: "Booking request unsuccessful"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save
    redirect_to user_path(current_user), notice: "Booking status updated, look at your profile. Look closely."
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
