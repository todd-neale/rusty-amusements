class BookingPolicy < ApplicationPolicy
  # attr_reader :user, :booking

  # def initialize(user, booking)
  #   @user = user
  #   @booking = booking
  # end

  def create?
    true
  end

  def update?
    user == record.amusement.user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
