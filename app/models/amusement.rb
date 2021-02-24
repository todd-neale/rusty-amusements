class Amusement < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, :tagline, :description, :price, :deathcount, :size, :category, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

