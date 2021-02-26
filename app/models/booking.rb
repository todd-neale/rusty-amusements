require 'date'

class Booking < ApplicationRecord
  belongs_to :amusement
  belongs_to :user
  has_one :review, dependent: :destroy


  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date
  validates :status, inclusion: { in: %w(pending confirmed rejected cancelled completed) }

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
