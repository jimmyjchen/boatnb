class User < ApplicationRecord
  has_many :boats
  has_many :bookings
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true, allow_blank: false

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
