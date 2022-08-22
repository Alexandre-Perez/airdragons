class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dragon
  has_many :reviews
end
