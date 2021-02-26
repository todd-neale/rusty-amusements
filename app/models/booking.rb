require 'date'

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :amusement
  has_one :review

  validates :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(pending confirmed rejected cancelled completed) }
end
