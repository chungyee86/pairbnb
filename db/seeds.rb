# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#1
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed Users
user = {}
user['password'] = 'asdf'
# user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do
    user['first_name'] = Faker::Name.first_name
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['gender'] = rand(1..2)
    user['phone'] = Faker::PhoneNumber.phone_number
    # user['country'] = Faker::Address.country
    user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)

    User.create(user)
  end
end

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  50.times do
    # listing['place_type'] = rand(1..3)
    # listing['city'] = Faker::Address.city
    # listing['zipcode'] = Faker::Address.zip_code
    # listing['bed_number'] = rand(1..6)
    # listing['room_number'] = rand(0..5)
    listing['name'] = Faker::App.name
    listing['location'] = Faker::Address.street_address
    listing['state'] = Faker::Address.state
    listing['country'] = Faker::Address.country
    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence
    listing['room_type'] = ["Entire home", "Private home", "Shared room"].sample
    listing['no_of_guest'] = rand(1..10)
    listing['user_id'] = uids.sample
    listing['start_date'] = Faker::Date.between(2.days.ago, Date.today)
    listing['end_date'] = Faker::Date.forward(rand(1..7))

    Listing.create(listing)
  end
end
