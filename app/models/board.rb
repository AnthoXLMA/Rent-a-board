class Board < ApplicationRecord
  belongs_to :user
  # belongs_to :supplier

  has_many :users, through: :bookings
  # has_many :owners

  has_many :bookings, :inverse_of => :boards
  accepts_nested_attributes_for :bookings

  has_and_belongs_to_many :bookings, join_table: 'board_bookings'

  has_many :reviews

  has_one_attached :photo

  # scope :in_print, -> { where(out_of_print: false) }
  # scope :out_of_print, -> { where(out_of_print: true) }
  # scope :old, -> { where('year_published < ?', 50.years.ago )}
  # scope :out_of_print_and_expensive, -> { out_of_print.where('price > 500') }
  # scope :costs_more_than, ->(amount) { where('price > ?', amount) }

  # validates :name, :contact, :size, :brand, :price, presence: true
  # validates :description, length: { maximum: 500 }
  # validates :size, inclusion: { in: %w(small medium large) }
  # validates :price, numericality: true

  BRAND = ["Quiksilver", "Decathlon", "Adidas", "Nike"]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
