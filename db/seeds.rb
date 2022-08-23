# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "creating"

User.destroy_all
Dragon.destroy_all

puts "destroy finished"

20.times do
 user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    phone_number: Faker::PhoneNumber.phone_number
  )

  Dragon.create!(
    user: user,
    name: Faker::Movies::HowToTrainYourDragon.dragon,
    description: Faker::Fantasy::Tolkien.poem,
    address: Faker::Address.city
  )
end

puts "finished"
