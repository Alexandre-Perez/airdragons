class Dragon < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
end
