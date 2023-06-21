# db/seeds.rb

# Create 10 demo users
10.times do |n|
  user = User.create!(
    name: "User #{n+1}",
    email: "user#{n+1}@example.com",
    password: "password",
    password_confirmation: "password",
    confirmed_at: Time.now, # Mark the user as confirmed
    posts_counter: 0 # Set the posts counter to zero initially
  )

  puts "Created user: #{user.email}"
end
