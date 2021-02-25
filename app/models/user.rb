class User < ApplicationRecord
  has_one_attached :photo
  has_many :amusements
  has_many :bookings
  has_many :reviews
  before_validation :name_or_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
  def name_or_email
    unless self.name
      self.name = self.email.split('@').first
    end
  end
end
