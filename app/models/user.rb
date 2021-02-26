class User < ApplicationRecord
  has_one_attached :photo
  has_many :amusements, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
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
