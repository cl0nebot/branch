# create some dummy users
20.times do |n|
  pass = SecureRandom.uuid
  u = User.create({
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: pass,
    password_confirmation: pass
  })

  p = Profile.create({
    user_id: u.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    summary: Faker::Lorem.paragraph(2),
    city: Faker::Address.city,
    state: Faker::Address.state,
    xcoord: (SecureRandom.random_number * 200 - 100).to_i,
    ycoord: (SecureRandom.random_number * 200 - 100).to_i
  })

  prop = Proposal.create({
    user_id: u.id,
    subject: Faker::Lorem.sentences(1).join(" "),
    body: Faker::Lorem.words(150).join(" "),
    upvotes: SecureRandom.random_number * 100,
    downvotes: SecureRandom.random_number * 100
  })

  u.feed_items.publish(prop)

  voter = Voter.new(prop.upvotes, prop.downvotes, prop.created_at)
  prop.heat = voter.calculate_heat
  prop.confidence = voter.calculate_confidence

  prop.save
end

# create a test user. The reason why this shouldn't
# be run in production should be made clear by the
# password field
if Rails.env.development?
  unless u = User.where(email: 'test@email.com').first
    u = User.create({
      username: "testuser",
      email: "test@email.com",
      password: "password",
      password_confirmation: "password",
    })
  end

  p = Profile.create({
    user_id: u.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    summary: Faker::Lorem.paragraph(2),
    city: Faker::Address.city,
    state: Faker::Address.state,
    xcoord: (SecureRandom.random_number * 200 - 100).to_i,
    ycoord: (SecureRandom.random_number * 200 - 100).to_i
  })

  prop = Proposal.create({
    user_id: u.id,
    subject: Faker::Lorem.sentences(1).join(" "),
    body: Faker::Lorem.words(150).join(" "),
    upvotes: SecureRandom.random_number * 100,
    downvotes: SecureRandom.random_number * 100
  })

  u.feed_items.publish(prop)

  voter = Voter.new(prop.upvotes, prop.downvotes, prop.created_at)
  prop.heat = voter.calculate_heat
  prop.confidence = voter.calculate_confidence

  prop.save

  3.times do |n|
    pass = SecureRandom.uuid
    friend = User.create({
      username: Faker::Internet.user_name,
      email: Faker::Internet.email,
      password: pass,
      password_confirmation: pass
    })

    Profile.create({
      user_id: friend.id,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      summary: Faker::Lorem.paragraph(2),
      city: Faker::Address.city,
      state: Faker::Address.state,
      xcoord: (SecureRandom.random_number * 200 - 100).to_i,
      ycoord: (SecureRandom.random_number * 200 - 100).to_i
    })

    u.friendships.create({
      friend_id: friend.id,
      confirmed: true
    })

    friend.friendships.create({
      friend_id: u.id,
      confirmed: true
    })

    prop = Proposal.create({
      user_id: friend.id,
      subject: Faker::Lorem.sentences(1).join(" "),
      body: Faker::Lorem.words(150).join(" "),
      upvotes: SecureRandom.random_number * 100,
      downvotes: SecureRandom.random_number * 100
    })

    friend.feed_items.publish(prop)

    voter = Voter.new(prop.upvotes, prop.downvotes, prop.created_at)
    prop.heat = voter.calculate_heat
    prop.confidence = voter.calculate_confidence

    prop.save
  end
end
