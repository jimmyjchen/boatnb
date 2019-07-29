
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  user = User.create!(first_name: Faker::TvShows::GameOfThrones.character,
                     last_name: Faker::Creature::Animal.name,
                     email: Faker::Internet.email,
                     password: '123456')
  p user
  rand(1..5).times do
    boat = Boat.new(description: Faker::Quote.yoda,
                    price: rand(1..1000000),
                    title: Faker::Quote.robin)
    boat.user = user
    boat.save!
    p boat
  end
end

puts "added #{User.count} users, #{Boat.count} boats"
