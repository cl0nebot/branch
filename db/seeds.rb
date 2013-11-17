# create some dummy users
10.times do |n|
  pass = SecureRandom.uuid
  u = User.create({
    username: "User#{n}",
    email: "user#{n}@email.com",
    password: pass,
    password_confirmation: pass
  })

  p = Profile.create({
    user_id: u.id,
    xcoord: (SecureRandom.random_number * 200 - 100).to_i,
    ycoord: (SecureRandom.random_number * 200 - 100).to_i
  })
end

# create a test user. The reason why this shouldn't
# be run in production should be made clear by the
# password field
if Rails.env.development?
  u = User.create({
    username: "Test User",
    email: "test@email.com",
    password: "password",
    password_confirmation: "password",
  })

  p = Profile.create({
    user_id: u.id,
    xcoord: (SecureRandom.random_number * 200 - 100).to_i,
    ycoord: (SecureRandom.random_number * 200 - 100).to_i
  })

end
