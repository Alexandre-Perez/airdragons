class Dragon < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
end
