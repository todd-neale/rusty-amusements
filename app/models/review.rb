class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  has_one :amusement, through: :booking

  validates :rating, inclusion: { in: [0,1,2,3,4,5] }
  validates :comment, presence: true
end
