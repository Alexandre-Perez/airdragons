class Dragon < ApplicationRecord
  # belongs to booking
  has_one_attached :photo

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
