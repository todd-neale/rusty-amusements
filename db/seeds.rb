# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.
puts "scrapping amusements, killing users"
Booking.destroy_all
Amusement.destroy_all
User.destroy_all

puts "generating users and amusements"


  user1 = User.new(email: "rusty@test.com", password: 'password', password_confirmation: 'password')
  user1.save

  amusement1 = Amusement.new(name: Faker::Beer.name, description: Faker::Hipster.paragraph(sentence_count: 12), price: rand(200..10000), tagline: Faker::Cannabis.health_benefit, deathcount: rand(0..99) )
  amusement1.haskilledanimals = rand(1..10) < 6
  amusement1.childunfriendly = rand(1..10) < 6
  amusement1.heightrestriction = rand(1..10) < 6
  amusement1.haunting = rand(1..10) < 6
  amusement1.illegal = rand(1..10) < 6
  amusement1.washingmachine = rand(1..10) < 6
  amusement1.size = ['Small', 'Medium', 'Large', 'XL'].sample
  amusement1.category = ['Bouncy Castle', 'Dodgems', 'Merry-Go-Round', 'Waterride', 'Haunted House', 'House of Mirrors', 'Pendulum Ride', 'Droptower', 'Rollercoaster', 'Teacups', 'Waltzer', 'High Striker', 'Washing Machine', 'Other'].sample
  amusement1.user = user1
  p amusement1.save

avatar_cloudinary_keys = %w(gurn8_hh9b0p gurn7_r8ez4f gurn6_tbcttg gurn3_k3mi0n gurn4_q1onca gurn1_s3il5m gurn2_fzkdqc gurn5_swk2oo)

9.times do
  user = User.new(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
  user.save

  amusement = Amusement.new(name: Faker::Beer.name, description: Faker::Hipster.paragraph(sentence_count: 12), price: rand(200..10000), tagline: Faker::Cannabis.health_benefit, deathcount: rand(0..99) )
  amusement.haskilledanimals = rand(1..10) < 6
  amusement.childunfriendly = rand(1..10) < 6
  amusement.heightrestriction = rand(1..10) < 6
  amusement.haunting = rand(1..10) < 6
  amusement.illegal = rand(1..10) < 6
  amusement.washingmachine = rand(1..10) < 6
  amusement.size = ['Small', 'Medium', 'Large', 'XL'].sample
  amusement.category = ['Bouncy Castle', 'Dodgems', 'Merry-Go-Round', 'Waterride', 'Haunted House', 'House of Mirrors', 'Pendulum Ride', 'Droptower', 'Rollercoaster', 'Teacups', 'Waltzer', 'High Striker', 'Washing Machine', 'Other'].sample
  amusement.user = user
  amusement.save
end

puts "finished"


