class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :description, :price, :title, presence: true, allow_blank: false
end
