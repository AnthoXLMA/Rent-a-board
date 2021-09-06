class Board < ApplicationRecord
  belongs_to :owner
  belongs_to :accounts
  belongs_to :supplier
  has_many :customers, through: :bookings

  has_many :board_payments, dependent: :destroy, :inverse_of => :account
  accepts_nested_attributes_for :board_payments

  has_many :bookings
  has_and_belongs_to_many :bookings

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

  AVAILABILITY = ['Available', 'Booked', 'Over']

  BRAND = ['Quiksilver', 'Adams Surfboard', 'Decathlon', 'SEO']

  SIZE = [' 6″ – 6’8″', '6’8″ – 7’4″', '7’4″ – 8’6″', '8’6″ – 9’2″', '9’2″ – 9’6″', '+ de 9’6″']

  SHAPE = ['Fish', 'ShortBoard', 'Hybride', 'Funboard', 'Gunboard', 'Longboard']

    geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
