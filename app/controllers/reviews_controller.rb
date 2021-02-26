class ReviewsController < ApplicationController
  def create
    @review = Review.new review_params
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user = current_user
    if @review.save
      redirect_to amusement_path(@booking.amusement, anchor: "review-#{@review.id}", rev_id: @review.id), notice: "review submitted, have a look"
    else
      redirect_to user_path(current_user), notice: "review failed, maybe have another go"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
