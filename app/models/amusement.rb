class Amusement < ApplicationRecord
  belongs_to :user

  validates :name, :description, :photo, :price, presence: true
end
