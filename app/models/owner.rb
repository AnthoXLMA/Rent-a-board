class Owner < ApplicationRecord
  # has_many :owners, dependent: :destroy, :inverse_of => :account
  # accepts_nested_attributes_for :owners
  belongs_to :account
  accepts_nested_attributes_for :account

  belongs_to :user
  accepts_nested_attributes_for :user

  has_many :boards

  has_many :board_payments, :through => :bookings

  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules


  has_many :bookings, dependent: :destroy
  accepts_nested_attributes_for :bookings

  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules

  # mount_uploader :photo, TrainerUploader
  has_one_attached :photo

  def name
    "#{first_name} #{last_name}"
  end

  def email
    User.find_by_id(self.user_id)
  end
end
