class Customer < ApplicationRecord
  has_many :bookings
  has_many :reviews

  has_many :customers, dependent: :destroy, :inverse_of => :account
  accepts_nested_attributes_for :customers

  belongs_to :account, :inverse_of => :customers
  accepts_nested_attributes_for :account

  belongs_to :user, :inverse_of => :customers
  accepts_nested_attributes_for :user

  has_many :bookings, dependent: :destroy, :inverse_of => :customer
  accepts_nested_attributes_for :bookings

  has_many :boards, :through => :bookings

  has_many :board_payments, :through => :bookings

  # mount_uploader :photo, ClientUploader

  def name
    "#{first_name} #{last_name}"
  end

  def email
    User.find_by_id(self.user_id)
  end
end
