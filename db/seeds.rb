require 'faker'

# Create Posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all 

# Create Comments
100.times do 
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

puts "Seed finished!"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

# Saves you an update to the DB if the record already exists
if Post.find_by_title("A unique title")
  puts "this unique post is already created"
else
  Post.create(title: "A unique title", body: "This is a unique body")
  puts "created a unique post"
end

if Comment.find_by_body("A unique comment")
  puts "this unique comment is already created"
else
  Comment.create(post: posts.sample, body: "A unique comment")
  puts "created a unique comment"
end

