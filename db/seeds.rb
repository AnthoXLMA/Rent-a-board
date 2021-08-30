# Seed pour USER
puts "cleaning DB"
Booking.delete_all
Board.delete_all
Supplier.delete_all
Owner.delete_all
Account.delete_all
User.delete_all


puts 'CREATING USERS'
anthony = User.new(
  first_name: "Anthony",
  last_name: "Mania",
  location:"Paris",
  email:"Antho@example.com",
  password: "password",
  phone_number: "0635158132",
  )
anthony.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/jack.jpeg')), filename: 'jack.jpeg')
anthony.save!

jean = User.new(
  first_name: "Jean",
  last_name:"Bossard",
  location:"Lyon",
  email:"jean@example.com",
  password: "password",
  phone_number: "1234567890",
  )
jean.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/method.jpg')), filename: 'method.jpg')
jean.save!

jorge = User.new(
  first_name: "Jorge",
  last_name: "De Almeida",
  location:"New York",
  email:"Jorge@example.com",
  password: "password",
  phone_number: "0614814349",
  )
jorge.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/rza.jpg')), filename: 'rza.jpg')
jorge.save!

puts 'CREATING ACCOUNTS'
account1 = Account.new(
  created_at: "21-10-2021",
  updated_at: "22-10-2021",
  user_id: anthony.id
  )
account1.save!

account2 = Account.new(
  created_at: "01-10-2021",
  updated_at: "02-10-2021",
  user_id: jean.id
  )
account2.save!

account3 = Account.new(
  created_at: "21-09-2021",
  updated_at: "22-11-2021",
  user_id: jorge.id
  )
account3.save!

puts 'CREATING OWNERS'
anthony = Owner.new(
  account_id: account1.id,
  user_id: anthony.id
  )
anthony.save!

jean = Owner.new(
  account_id: account2.id,
  user_id: jean.id
  )
jean.save!

jorge = Owner.new(
  account_id: account3.id,
  user_id: jorge.id
  )
jorge.save!

puts 'CREATING CUSTOMERS'
jean = Customer.new(
  user_id: jean.id,
  account_id: jean.id
  )
jean.save!

anthony = Customer.new(
  user_id: anthony.id,
  account_id: anthony.id
  )
anthony.save!

puts 'CREATING SCHEDULES'
agenda1 = Schedule.new(
  created_at: "20-12-2021",
  updated_at: "22-12-2021",
  account_id: account1.id,
  owner_id: anthony.id
  )
agenda1.save!

puts 'CREATING SUPPLIERS'
quiksilver = Supplier.new(
  name: "Quiksilver",
  contact: "Rio De Janeiro"
  )
quiksilver.save!

decathlon = Supplier.new(
  name: "Decathlon",
  contact: "Rio De Janeiro"
  )
decathlon.save!

adamsurfboard = Supplier.new(
  name: "Adams Surfboard",
  contact: "Rio De Janeiro"
  )
adamsurfboard.save!

puts 'CREATING BOARDS'
sharkbaby = Board.new(
  name: "Baby Shark",
  size: "long",
  shape: "longboard",
  brand: "Decathlon",
  price: "5",
  address: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: jorge.id,
  owner_id: jorge.id,
  supplier_id: decathlon.id
  )
sharkbaby.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
sharkbaby.save!

astralwave = Board.new(
  name: "Astral wave",
  size: "short",
  shape: "shortboard",
  brand: "quiksilver",
  price: "23",
  address: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: jean.id,
  owner_id: jean.id,
  supplier_id: quiksilver.id
  )
astralwave.photo.attach(io: File.open(Rails.root.join('db/fixtures/planche-de-surf-evolutive-ms-easy-pony.jpg')), filename: 'longboard.jpg')
astralwave.save!

shortythug = Board.new(
  name: "Shorty Thug",
  size: "short",
  brand: "adamsurfboard",
  shape: "hybride",
  price: "50",
  address: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: anthony.id,
  owner_id: anthony.id,
  supplier_id: adamsurfboard.id
  )
shortythug.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
shortythug.save!

gabrielboard = Board.new(
  name: "Medina's Wheel",
  size: "long",
  brand: "quiksilver",
  price: "20",
  shape: "gunboard",
  address: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: anthony.id,
  owner_id: anthony.id,
  supplier_id: quiksilver.id
  )
gabrielboard.photo.attach(io: File.open(Rails.root.join('db/fixtures/PLANCHEDESURFENMOUSSE6.0HOA_1080x.png')), filename: 'longboard.jpg')
gabrielboard.save!

johndoo = Board.new(
  name: "John Doo Elevator",
  size: "long",
  brand: "quiksilver",
  shape: "hybride",
  price: "30",
  address: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: jean.id,
  owner_id: jean.id,
  supplier_id: quiksilver.id
  )
johndoo.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
johndoo.save!

puts 'CREATING BOOKINGS'
astral_loc = Booking.new(
 start_on: Time.now,
 end_on: Time.now + 10.days,
 total_price: "30",
 # status: status.value,
 user_id: jean.id,
 board_id: astralwave.id,
 account_id:account1.id,
 owner_id:jean.id,
 customer_id: anthony.id,
 schedule_id:agenda1.id
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
