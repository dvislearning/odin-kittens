# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
	Kitten.create(name: "#{Faker::Cat.name}", age:rand(1..15), cuteness:rand(1..10), softness:rand(1..10), created_at:Time.now)
end