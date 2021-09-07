class Board < ApplicationRecord
  belongs_to :user
  # belongs_to :owner
  # belongs_to :supplier

  has_many :customers, through: :bookings

  has_many :bookings
  # has_and_belongs_to_many :bookings

  # has_many :reviews

  has_one_attached :photo

  AVAILABILITY = ['Available', 'Booked', 'Over']

  BRAND = ['Quiksilver', 'Adams Surfboard', 'Decathlon', 'SEO']

  SIZE = [' 6″ – 6’8″', '6’8″ – 7’4″', '7’4″ – 8’6″', '8’6″ – 9’2″', '9’2″ – 9’6″', '+ de 9’6″']

  SHAPE = ['Fish', 'ShortBoard', 'Hybride', 'Funboard', 'Gunboard', 'Longboard']

    geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
