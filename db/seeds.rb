require 'open-uri'

puts "scrapping amusements, killing users"
Review.destroy_all
Booking.destroy_all
Amusement.destroy_all
User.destroy_all

puts "generating users, amusements, bookings, reviews"

def gen_random_amusement
  amusement = Amusement.new(name: Faker::Beer.name, description: Faker::Hipster.paragraph(sentence_count: 12), price: rand(200..10000), tagline: Faker::Cannabis.health_benefit, deathcount: rand(0..99) )
  amusement.haskilledanimals = rand(1..10) < 6
  amusement.childunfriendly = rand(1..10) < 6
  amusement.heightrestriction = rand(1..10) < 6
  amusement.haunting = rand(1..10) < 6
  amusement.illegal = rand(1..10) < 6
  amusement.washingmachine = rand(1..10) < 6
  amusement.size = ['Small', 'Medium', 'Large', 'XL'].sample
  amusement.category = ['Bouncy Castle', 'Dodgems', 'Merry-Go-Round', 'Waterride', 'Haunted House', 'House of Mirrors', 'Pendulum Ride', 'Droptower', 'Rollercoaster', 'Teacups', 'Waltzer', 'High Striker', 'Washing Machine', 'Other'].sample
  amusement_address_array = [
    'Netherbury, Dorset',
    'Whitchurch Canonicorum, Dorset',
    'Nettlecombe, Dorset',
    'Bridport, Dorset',
    'Toller Fratrum, Dorset',
    'North Poorton, Dorset',
    'Spyway Askerswell, Dorset',
    'Burton Bradstock, Dorset',
    'West Bexington, Dorset',
    'Eype, Dorset',
    'Seatown, Dorset',
    'Watton, Dorset',
    'Symondsbury, Dorset',
  ]
  amusement.address = amusement_address_array.sample
  amusement_img_array = [
    'https://res.cloudinary.com/arfacamble/image/upload/v1614173605/41ffb9b530b6ab233665b084c2fbc25a_xx6hlf.jpg',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614173605/14a61a9e86598bf56a7c4ccd55855ef8_mh6nth.jpg',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614173606/e3c08962db058d0e0ab41895b961b379_f6tvyq.jpg',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614173605/5b3513848d78317d9d2920e5c24f61e7--abandoned-homes-abandoned-places_cruqsr.jpg',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614173606/930e4931-d1c4-41ca-a25c-db1b7a62c04a-six-flags-nola_jedzmu.jpg',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614173606/maxresdefault_gv4baq.jpg',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614173606/2871019.main_image_upnh4v.webp',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614173606/fa5ef2fae1354df2cfbab3127155062d_d7nsjh.jpg'
  ]
  img = URI.open(amusement_img_array.sample)
  amusement.photos.attach(io: img, filename: "photo", content_type: 'image/png')
  amusement
end

def assign_random_avatar(user)
  avatar_array = [
    'https://res.cloudinary.com/arfacamble/image/upload/v1614102488/gurn8_hh9b0p.webp',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614102488/gurn7_r8ez4f.webp',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614102488/gurn5_swk2oo.webp',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614102488/gurn4_q1onca.webp',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614102488/gurn1_s3il5m.webp',
    'https://res.cloudinary.com/arfacamble/image/upload/v1614102488/gurn2_fzkdqc.webp'
  ]
  img_link = avatar_array.sample
  img = URI.open(img_link)
  user.photo.attach(io: img, filename: "avatar.webp", content_type: 'image/png')
  user
end

rusty = User.new(email: "rusty@test.com", name: 'Rusty Frabbe-Hoooole', password: 'password', password_confirmation: 'password')
avatar_img = URI.open('https://res.cloudinary.com/arfacamble/image/upload/v1614102488/gurn3_k3mi0n.webp')
rusty.photo.attach(io: avatar_img, filename: 'avatar.png', content_type: 'image/png')
rusty.save
amusement1 = Amusement.new(name: 'Death Roller', description: Faker::Hipster.paragraph(sentence_count: 12), price: rand(200..10000), tagline: 'Wood pre-charred, safety sold separately', deathcount: rand(0..99), haskilledanimals: true, childunfriendly:false, heightrestriction: true, haunting: false, illegal: true, washingmachine: true, size: 'Large', category: 'Rollercoaster', address: 'Bothenhampton, Dorset' )
amusement1.user = rusty
amuse_img = URI.open('https://res.cloudinary.com/arfacamble/image/upload/v1614172490/derilict-comet-rollercoaster-in-lincoln-park-massachusetts-abandoned-1987-via-psfk_vbldbo.jpg')
amusement1.photos.attach(io: amuse_img, filename: "roller.jpg", content_type: 'image/png')
amusement1.save
amusement2 = Amusement.new(name: 'Dodgy Dodgers', description: Faker::Hipster.paragraph(sentence_count: 12), price: rand(200..10000), tagline: 'Rust-infused, tetanus-rich, immobile', deathcount: rand(0..99), haskilledanimals: false, childunfriendly:true, heightrestriction: false, haunting: true, illegal: false, washingmachine: false, size: 'Small', category: 'Dodgems', address: 'Shipton Gorge, Dorset' )
amusement2.user = rusty
amuse2_img = URI.open('https://res.cloudinary.com/arfacamble/image/upload/v1614341651/dodgems_nbs7up.jpg')
amusement2.photos.attach(io: amuse2_img, filename: "dodgems.jpg", content_type: 'image/png')
amusement2.save

schmuck = User.new(email: 'schmuck@test.com', password: 'password', password_confirmation: 'password', name: "Schmuck McFool")
avatar_img = URI.open('https://res.cloudinary.com/arfacamble/image/upload/v1614102488/gurn6_tbcttg.webp')
schmuck.photo.attach(io: avatar_img, filename: 'avatar.png', content_type: 'image/png')
schmuck.save

schmuck_first_booking = Booking.new(start_date: "2021-02-01", end_date: "2021-02-04", status: 'completed')
schmuck_first_booking.user = schmuck
schmuck_first_booking.amusement = amusement1
schmuck_first_booking.save

schmuck_review_one = Review.new(rating: 5, comment: "killed three of my guests. EXCELLENT!")
schmuck_review_one.user = schmuck
schmuck_review_one.booking = schmuck_first_booking
schmuck_review_one.save

schmuck_second_booking = Booking.new(start_date: "2021-02-08", end_date: "2021-02-12", status: 'completed')
schmuck_second_booking.user = schmuck
schmuck_second_booking.amusement = amusement2
schmuck_second_booking.save

schmuck_review_two = Review.new(rating: 2, comment: "Children enjoyed far too much. None got tetanus, quite disappointed")
schmuck_review_two.user = schmuck
schmuck_review_two.booking = schmuck_second_booking
schmuck_review_two.save

3.times do
  user = User.new(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
  user = assign_random_avatar(user)
  user.save

  3.times do
    amusement = gen_random_amusement
    amusement.user = user
    amusement.save
  end
end

avatar_arr = [
  'https://res.cloudinary.com/arfacamble/image/upload/v1614345238/15oa1l_d2svad.jpg',
  'https://res.cloudinary.com/arfacamble/image/upload/v1614345238/NAKcaTMU_400x400_crpeiu.jpg',
  'https://res.cloudinary.com/arfacamble/image/upload/v1614345238/72580072_diivzt.jpg'
]
count = 0
3.times do
  user = User.new(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
  avatar_img = URI.open(avatar_arr[count])
  user.photo.attach(io: avatar_img, filename: 'avatar.png', content_type: 'image/png')
  user.save
  amusements = Amusement.all.reject { |a| a.user == rusty }
  amusements.each do |amusement|
    booking = Booking.new(start_date: "2021-02-08", end_date: "2021-02-12", status: 'completed')
    booking.user = user
    booking.amusement = amusement
    booking.save

    review = Review.new(rating: rand(1..5), comment: Faker::Movies::Lebowski.quote)
    review.user = user
    review.booking = booking
    review.save
  end
  count += 1
end

puts "finished"
