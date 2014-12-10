User.create!(name:  "admin",
             email: "admin@railstutorial.org",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
# User.create!(name:  "Nick Joung",
#             email: "njoung@yahoo.com",
#             password:              "testpassword",
#             password_confirmation: "testpassword",
#             admin: true,
#             activated: true,
#             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end



users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end