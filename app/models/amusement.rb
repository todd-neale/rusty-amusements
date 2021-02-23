class Amusement < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, :tagline, :description, :price, :deathcount, :size, :category, presence: true
end

