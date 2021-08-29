class Owner < ApplicationRecord
  # has_many :owners, dependent: :destroy, :inverse_of => :account
  # accepts_nested_attributes_for :owners

  has_many :schedules, dependent: :destroy, :inverse_of => :account
  accepts_nested_attributes_for :schedules

  belongs_to :account, :inverse_of => :owners
  accepts_nested_attributes_for :account

  belongs_to :user, :inverse_of => :owners
  accepts_nested_attributes_for :user

  has_many :bookings, dependent: :destroy, :inverse_of => :owner
  accepts_nested_attributes_for :bookings

  has_many :boards, :through => :bookings

  has_many :board_payments, :through => :bookings

  has_many :schedules, dependent: :destroy, :inverse_of => :owner
  accepts_nested_attributes_for :schedules

  # mount_uploader :photo, TrainerUploader

  def name
    "#{first_name} #{last_name}"
  end

  def email
    User.find_by_id(self.user_id)
  end
end
