class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @amusements = Amusement.limit(4)
    @total = 0
    @count = 0
    Amusement.all.each do |amusement|
      amusement.reviews.each do |review|
        @total += review.rating
        @count += 1
      end
    end
    @sum = @total/@count
  end
end
