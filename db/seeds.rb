# Seed pour USER
puts "cleaning DB"
Booking.delete_all
Board.delete_all
Supplier.delete_all
User.delete_all

puts 'Creating users...'
antho = User.new(
  first_name: "Antho",
  last_name: "Dupont",
  location:"Paris",
  email:"Antho@example.com",
  password: "password",
  phone_number: "0635158132",
  )
antho.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/jack.jpeg')), filename: 'jack.jpeg')
antho.save!

jean = User.new(
  first_name: "Jean",
  last_name:"Bourvil",
  location:"Rio de Janeiro",
  email:"Jean@example.com",
  password: "password",
  phone_number: "1234567890",
  )
jean.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/method.jpg')), filename: 'method.jpg')
jean.save!

jorge = User.new(
  first_name: "Jorge",
  last_name: "De Almeida",
  location:"New York",
  email:"Bill@example.com",
  password: "password",
  phone_number: "0614814349",
  )
jorge.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/rza.jpg')), filename: 'rza.jpg')
jorge.save!

puts 'Creating suppliers...'
quiksilver = Supplier.new(
  name: "Quiksilver",
  contact: "Rio De Janeiro"
  )
quiksilver.save!


decathlon = Supplier.new(
  name: "decathlon",
  contact: "Rio De Janeiro"
  )
decathlon.save!


adamsurfboard = Supplier.new(
  name: "Adams Surfboard",
  contact: "Rio De Janeiro"
  )
adamsurfboard.save!

# Seeding Trees
puts 'Creating boards...'
sharkbaby = Board.new(
  name: "Baby Shark",
  size: "long",
  shape: "longboard",
  brand: "Decathlon",
  price: 5,
  address: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: jorge.id,
  supplier_id: decathlon.id
  )
sharkbaby.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
sharkbaby.save!


astralwave = Board.new(
  name: "Astral wave",
  size: "short",
  shape: "shortboard",
  brand: "quiksilver",
  price: 5,
  address: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: jean.id,
  supplier_id: quiksilver.id
  )
astralwave.photo.attach(io: File.open(Rails.root.join('db/fixtures/planche-de-surf-evolutive-ms-easy-pony.jpg')), filename: 'longboard.jpg')
astralwave.save!

shortythug = Board.new(
  name: "Shorty Thug",
  size: "short",
  brand: "adamsurfboard",
  shape: "hybride",
  price: 5,
  address: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: antho.id,
  supplier_id: adamsurfboard.id
  )
shortythug.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
shortythug.save!

gabrielshark = Board.new(
  name: "Medina's Wheel",
  size: "long",
  brand: "quiksilver",
  price: 5,
  shape: "gunboard",
  address: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: antho.id,
  supplier_id: quiksilver.id
  )
gabrielshark.photo.attach(io: File.open(Rails.root.join('db/fixtures/PLANCHEDESURFENMOUSSE6.0HOA_1080x.png')), filename: 'longboard.jpg')
gabrielshark.save!

johndoo = Board.new(
  name: "John Doo Elevator",
  size: "long",
  brand: "quiksilver",
  shape: "hybride",
  price: 5,
  address: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: jean.id,
  supplier_id: quiksilver.id
  )
johndoo.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
johndoo.save!

# Seeding Rentals
puts 'Creating bookings...'
astral_loc = Booking.new(
 start_on: Time.now,
 end_on: Time.now + 10.days,
 total_price: "30",
 # status: status.value,
 user_id: antho.id,
 board_id: astralwave.id
 )
astral_loc.save!

puts 'Finished!'

# Seeding Rentals
# 5.times do
#   new_rental = Rental.new(
#     user_id: Faker::IDNumber.valid,
#     tree_id: Faker::Name.name,
#     start_on: Faker::Date.between(from: 2.days.ago, to: Date.today),
#     end_on: Faker::Date.between(from: 2.days.ago, to: Date.today),
#     total_price: Faker::Number.decimal(l_digits: 2),
#     )
#   new_rental.save!
# end

#Seeding Users
# 5.times do
#   new_user = User.new(
#     first_name: Faker::Name.first_name,
#     email: Faker::Internet.email,
#     phone_number: Faker::PhoneNumber.phone_number,
#     password: Faker::Number.number(digits: 10),
#   )
#   new_user.save!
# end
