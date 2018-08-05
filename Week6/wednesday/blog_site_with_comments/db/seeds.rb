# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'database_cleaner'
# DatabaseCleaner.clean_with(:truncation)

5.times do
  Post.create ( {
    title: Faker::Book.title,
    body: Faker::ChuckNorris.fact,
    author: Faker::LordOfTheRings.character
    })
end

# Post.all.each do |post|
#   post.author = Faker::LordOfTheRings.character
#   post.save
# end