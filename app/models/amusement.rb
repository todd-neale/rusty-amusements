class Amusement < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, :tagline, :description, :price, :deathcount, :size, :category, :address, presence: true
end

