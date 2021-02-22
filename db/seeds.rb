# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.
puts "scrapping amusements, killing users"

Amusement.destroy_all
User.destroy_all

puts "generating users and amusements"


  user1 = User.new(email: "rusty@test.com", password: 'password', password_confirmation: 'password')
  user1.save

  amusement1 = Amusement.new(name: Faker::Books::Lovecraft.tome, description: Faker::Books::Lovecraft.fhtagn, price: rand(200..10000))
  amusement1.user = user1
  amusement1.save

9.times do
  user = User.new(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
  user.save

  amusement = Amusement.new(name: Faker::Kpop.iii_groups, description: Faker::Cannabis.buzzword, price: rand(200..10000))
  amusement.user = user
  amusement.save
end

puts "finished"
