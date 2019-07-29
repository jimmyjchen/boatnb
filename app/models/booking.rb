class Booking < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  validates :date_start, :date_end, presence: true
end
