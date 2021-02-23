class Amusement < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, :tagline, :description, :price, :deathcount, :size, :category, :haskilledanimals, :washingmachine, :childunfriendly, :heightrestriction, :haunting, :illegal,
  presence: true
end

