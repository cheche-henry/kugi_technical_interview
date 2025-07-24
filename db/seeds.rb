# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

user1 = User.create!(name: "Alice")
user2 = User.create!(name: "Bob")

post1 = user1.posts.create!(
  title: "Welcome to My Blog",
  summary: "A short intro to my thoughts.",
  body: "This is my first blog post using Ruby on Rails and Tailwind CSS.",
  image_url: "https://source.unsplash.com/random/800x400"
)

post2 = user2.posts.create!(
  title: "Second Thoughts",
  summary: "Blogging is fun!",
  body: "Using Hotwire makes everything feel more modern.",
  image_url: "https://source.unsplash.com/random/800x401"
)

post1.comments.create!(body: "Great post!", user: user2)
post2.comments.create!(body: "I agree with you!", user: user1)
