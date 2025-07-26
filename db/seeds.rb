puts "🧹 Clearing existing data..."
Comment.delete_all
Post.delete_all
User.delete_all

puts "👤 Creating users..."
users = 5.times.map do |i|
  User.create!(
    name: "User #{i + 1}"
  )
end

puts "📝 Creating posts and comments..."
users.each do |user|
  10.times do
    post = Post.create!(
      title: Faker::Book.title,
      summary: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraphs(number: 5).join("\n\n"),
      image_url: "https://placehold.co/600x400",
      user: user
    )

    # Add 5 comments from random users
    5.times do
      commenter = users.reject { |u| u == user }.sample
      post.comments.create!(
        body: Faker::Lorem.sentence,
        user: commenter
      )
    end
  end
end

puts "✅ Done seeding!"
