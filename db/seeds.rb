# Seed pour USER
puts "cleaning DB"
Booking.delete_all
Board.delete_all
Supplier.delete_all
User.delete_all

puts 'Creating users...'
marco = User.new(
  first_name: "Marco",
  last_name: "Dupont",
  location:"Paris",
  email:"Marco@example.com",
  password: "password",
  phone_number: "0123456789",
  )
marco.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/avatar.png')), filename: 'avatar.png')
marco.save!

jean = User.new(
  first_name: "Jean",
  last_name:"Bourvil",
  location:"Rio de Janeiro",
  email:"Jean@example.com",
  password: "password",
  phone_number: "1234567890",
  )
jean.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/avatar.png')), filename: 'avatar.png')
jean.save!

jorge = User.new(
  first_name: "Jorge",
  last_name: "De Almeida",
  location:"New York",
  email:"Bill@example.com",
  password: "password",
  phone_number: "0023456789",
  )
jorge.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/avatar.png')), filename: 'avatar.png')
jorge.save!

puts 'Creating suppliers...'
quiksilver = Supplier.new(
  name: "Quiksilver",
  contact: "Rio De Janeiro"
  )
quiksilver.save!

# Seeding Trees
puts 'Creating boards...'
longboard = Board.new(
  name: "Longboard",
  size: "long",
  brand: "quiksilver",
  price: 5,
  contact: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: jorge.id,
  supplier_id: quiksilver.id
  )
longboard.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
longboard.save!


fusee = Board.new(
  name: "Fusee",
  size: "short",
  brand: "quiksilver",
  price: 5,
  contact: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: jean.id,
  supplier_id: quiksilver.id
  )
fusee.photo.attach(io: File.open(Rails.root.join('db/fixtures/planche-de-surf-evolutive-ms-easy-pony.jpg')), filename: 'longboard.jpg')
fusee.save!

shortythug = Board.new(
  name: "shortythug",
  size: "short",
  brand: "quiksilver",
  price: 5,
  contact: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: marco.id,
  supplier_id: quiksilver.id
  )
shortythug.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
shortythug.save!

gabrielshark = Board.new(
  name: "gabrielshark",
  size: "long",
  brand: "quiksilver",
  price: 5,
  contact: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: marco.id,
  supplier_id: quiksilver.id
  )
gabrielshark.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
gabrielshark.save!

johndoo = Board.new(
  name: "johndoo",
  size: "long",
  brand: "quiksilver",
  price: 5,
  contact: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: jean.id,
  supplier_id: quiksilver.id
  )
johndoo.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
johndoo.save!

puts 'Finished!'

# Seeding Rentals
#puts 'Creating Rentals...'
#cactus_loc = Rental.new(
#  start_on: Time.now,
#  end_on: Time.now + 10.days,
#  total_price: "230",
#  status: status.value,
#  user_id: marco.id,
#  tree_id: cactus.id
#  )
#cactus_loc.save!

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
