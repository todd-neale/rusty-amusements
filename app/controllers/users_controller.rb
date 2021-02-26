class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @owned_amusements = @user.amusements
    @bookings = Booking.where(user: @user)
    @lettings = Booking.joins(:amusement).where(amusement: @owned_amusements)
    authorize @user
  end
end
