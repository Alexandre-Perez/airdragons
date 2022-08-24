# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"



puts "Destroying existing database"

User.destroy_all
Dragon.destroy_all

puts "destroy finished"

puts "Creating new database"
20.times do
 user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    phone_number: Faker::PhoneNumber.phone_number
  )

  dragon = Dragon.new(
    user: user,
    name: Faker::Movies::HowToTrainYourDragon.dragon,
    description: Faker::Fantasy::Tolkien.poem,
    address: Faker::Address.country
  )

  file = URI.open("https://source.unsplash.com/random/?dragon")
  dragon.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  dragon.save!
end

puts "finished"
