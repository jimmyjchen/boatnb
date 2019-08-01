class Boat < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  validates :description, :price, :title, :photo, presence: true, allow_blank: false
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
