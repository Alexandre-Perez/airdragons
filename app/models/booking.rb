class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dragon
  has_many :reviews

  validates :start_date, presence: true, uniqueness: true
  validates :end_date, presence: true, uniqueness: true
end
