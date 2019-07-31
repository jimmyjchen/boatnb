class Boat < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  validates :description, :price, :title, :photo, presence: true, allow_blank: false
end
