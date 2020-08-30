# Seed pour USER
puts "cleaning DB"
Booking.delete_all
Board.delete_all
User.delete_all

puts 'Creating users...'
marco = User.new(
  first_name: "Marco",
  last_name: "Dupont",
  email:"Marco@example.com",
  password: "password",
  phone_number: "0123456789"
  )
marco.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/avatar.png')), filename: 'avatar.png')
marco.save!

jean = User.new(
  first_name: "Jean",
  last_name:"Bourvil",
  email:"Jean@example.com",
  password: "password",
  phone_number: "1234567890"
  )
jean.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/avatar.png')), filename: 'avatar.png')

jean.save!

bill = User.new(
  first_name: "Jorge",
  last_name: "De Almeida",
  email:"Bill@example.com",
  password: "password",
  phone_number: "0023456789"
  )
bill.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/avatar.png')), filename: 'avatar.png')
bill.save!


# Seeding Trees
puts 'Creating boards...'
longboard = Board.new(
  name: "Longboard",
  size: "long",
  brand: "quicksilver",
  price: 5,
  contact: "108 Avenida Atlantica, CEP4430 - Copacabana, Rio de Janeiro",
  description: "A very cool board for novices, children and other people wanting to learn in little waves",
  user_id: bill.id
  )
longboard.photo.attach(io: File.open(Rails.root.join('db/fixtures/longboard.jpg')), filename: 'longboard.jpg')
longboard.save!

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

#Seeding Trees
# 5.times do
#   new_tree = Tree.new(
#     name: Faker::Name.name,
#     user_id: Faker::IDNumber.valid,
#     description: Faker::Lorem.paragraph(sentence_count: 2),
#     species: Faker::JapaneseMedia::DragonBall.character,
#   )
#   new_tree.save!
# end


# # Seed pour Tree
# puts 'Creating trees...'
# new_tree = Tree.new(name: "Bonzaï", description: "cute little tree", user_id:"")
# new_tree.save!

# puts 'Creating rentals...'
# new_rental = Rental.new(start_on: "20200304", end_on:"20200312", total_price: "230")
# new_rental.save!

# Seeding Trees
# puts 'Creating rentals...'
# baobab = Tree.new(name: "Baobab")
# baobab.save!
# cactus = Tree.new(name: "Cactus")
# cactus.save!
# puts 'Finished!'
puts 'Finished!'
