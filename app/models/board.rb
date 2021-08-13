class Board < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_and_belongs_to_many :orders, join_table: 'boards_orders'
  has_one_attached :photo

  scope :in_print, -> { where(out_of_print: false) }
  scope :out_of_print, -> { where(out_of_print: true) }
  scope :old, -> { where('year_published < ?', 50.years.ago )}
  scope :out_of_print_and_expensive, -> { out_of_print.where('price > 500') }
  scope :costs_more_than, ->(amount) { where('price > ?', amount) }

  validates :name, :contact, :size, :brand, :price, presence: true
  validates :description, length: { maximum: 500 }
  validates :size, inclusion: { in: %w(small medium large) }
  validates :price, numericality: true
  geocoded_by :contact
  after_validation :geocode, if: :will_save_change_to_contact?
end
