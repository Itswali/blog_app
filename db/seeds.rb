# Users
User.create!(
  name: "John",
  photo: "john.jpg",
  bio: "I'm a software engineer.",
  email: "john@example.com",
  password: "password123", # Replace with a valid encrypted password
  confirmed_at: DateTime.now,
  posts_counter: 2,
  created_at: DateTime.now,
  updated_at: DateTime.now
)

User.create!(
  name: "Jane",
  photo: "jane.jpg",
  bio: "Web developer and designer.",
  email: "jane@example.com",
  password: "password456", # Replace with a valid encrypted password
  confirmed_at: DateTime.now,
  posts_counter: 3,
  created_at: DateTime.now,
  updated_at: DateTime.now
)
