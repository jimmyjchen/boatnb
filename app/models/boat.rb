class Boat < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, :price, :title, presence: true, allow_blank: false
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_taggable_on :tags
end
