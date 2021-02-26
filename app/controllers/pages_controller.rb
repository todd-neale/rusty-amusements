class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @amusements = Amusement.all.select {|amusement| amusement.reviews != [] }
    @amusements = @amusements.map do |amusement|
      total = 0
      count = 0
      amusement.reviews.each do |review|
        total += review.rating.to_f
        count += 1
      @sum = (total/count).round(1)
      end
      [amusement, @sum]
    end

    @amusements = @amusements.sort {|a,b| b[1] <=> a[1]}
    @amusements = @amusements.map {|amusement| amusement[0]}[0..3]
  end
end
