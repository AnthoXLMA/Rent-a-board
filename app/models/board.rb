class Board < ApplicationRecord
  has_many :rentals
  belongs_to :user
  has_one_attached :photo
  validates :name, :contact, :size, :brand, :price, presence: true
  validates :description, length: { maximum: 500 }
  validates :size, inclusion: { in: %w(small medium large) }
  validates :price, numericality: true
  geocoded_by :contact
  after_validation :geocode, if: :will_save_change_to_contact?
end
