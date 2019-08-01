class Booking < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  has_one :review, dependent: :destroy
  validates :date_start, :date_end, presence: true
  validate :end_must_be_after_start
  validate :start_must_not_be_before_today

  def end_must_be_after_start
    errors.add(:date_end, "must be after date start.") if date_start >= date_end
  end

  def start_must_not_be_before_today
    errors.add(:date_start, "should be at least today. Look ahead.") if date_start < Date.today
  end
end
