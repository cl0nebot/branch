def vote(model, num_votes)
  puts "Adding #{num_votes} votes for #{model}"
  Vote.transaction do
    num_votes.times do
      Vote.create({
        voteable_type: model.class.to_s,
        voteable_id: model.id,
        value: (SecureRandom.random_number * 2 - 1).round
      })
    end

    voter = Voter.new(model.votes.ups, model.votes.downs, model.created_at)

    if model.respond_to? :heat
      model.heat = voter.calculate_heat
    end

    model.confidence = voter.calculate_confidence
    model.save
  end
end

# create some dummy users
users = []
proposals = []

puts "creating some dummy users"
20.times do |n|
  pass = SecureRandom.uuid
  u = User.create({
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: pass,
    password_confirmation: pass
  })

  users << u

  puts "Making a profile for #{u}"
  p = Profile.create({
    user_id: u.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    summary: Faker::Lorem.paragraph(10),
    city: Faker::Address.city,
    state: Faker::Address.state,
    xcoord: (SecureRandom.random_number * 200 - 100).to_i,
    ycoord: (SecureRandom.random_number * 200 - 100).to_i,
    zcoord: (SecureRandom.random_number * 200 - 100).to_i
  })

  puts "Making a proposal for #{u}"
  prop = Proposal.create({
    user_id: u.id,
    subject: Faker::Lorem.sentences(1).join(" "),
    body: Faker::Lorem.words(150).join(" "),
  })

  vote(prop, 100)

  proposals << prop

  u.feed_items.publish(prop)
end

# Make some comments
puts "Making some comments and amendments"
users.each do |user|
  index = (SecureRandom.random_number * proposals.length).to_i
  
  com = Comment.create({
    user_id: user.id,
    commentable_type: "Proposal",
    commentable_id: proposals[index].id,
    body: Faker::Lorem.sentences(4).join(" ")
  })

  am = Amendment.create({
    user_id: user.id,
    proposal_id: proposals[index].id,
    subject: Faker::Lorem.sentences(1).join(" "),
    body: Faker::Lorem.sentences(4).join(" ")
  })

  user.feed_items.publish(am)
  user.feed_items.publish(com)

  vote(am, 100)
  vote(com, 100)

end



# create a test user. The reason why this shouldn't
# be run in production should be made clear by the
# password field

puts "Creating test user"
if Rails.env.development?
  ActiveRecord::Base.transaction do
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
      summary: Faker::Lorem.paragraph(10),
      city: Faker::Address.city,
      state: Faker::Address.state,
      xcoord: (SecureRandom.random_number * 200 - 100).to_i,
      ycoord: (SecureRandom.random_number * 200 - 100).to_i,
      zcoord: (SecureRandom.random_number * 200 - 100).to_i
    })

    prop = Proposal.create({
      user_id: u.id,
      subject: Faker::Lorem.sentences(1).join(" "),
      body: Faker::Lorem.words(150).join(" "),
    })

    u.feed_items.publish(prop)

    vote(prop, 100)

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
        summary: Faker::Lorem.paragraph(10),
        city: Faker::Address.city,
        state: Faker::Address.state,
        xcoord: (SecureRandom.random_number * 200 - 100).to_i,
        ycoord: (SecureRandom.random_number * 200 - 100).to_i,
        zcoord: (SecureRandom.random_number * 200 - 100).to_i
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
      })

      com = Comment.create({
        user_id: friend.id,
        commentable_type: "Proposal",
        commentable_id: prop.id,
        body: Faker::Lorem.sentences(4).join(" ")
      })

      am = Amendment.create({
        user_id: friend.id,
        proposal_id: prop.id,
        subject: Faker::Lorem.sentences(1).join(" "),
        body: Faker::Lorem.sentences(4).join(" ")
      })

      friend.feed_items.publish(am)
      friend.feed_items.publish(com)
      friend.feed_items.publish(prop)

      vote(prop, 100)
      vote(am, 100)
      vote(com, 100)
    end

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
      summary: Faker::Lorem.paragraph(10),
      city: Faker::Address.city,
      state: Faker::Address.state,
      xcoord: (SecureRandom.random_number * 200 - 100).to_i,
      ycoord: (SecureRandom.random_number * 200 - 100).to_i,
      zcoord: (SecureRandom.random_number * 200 - 100).to_i
    })

    friend.friendships.create({
      friend_id: u.id,
      confirmed: false
    })
  end
end

puts "Creating some dummy questions"
10.times do
  puts "making a question"
  Question.create(
    axis: (SecureRandom.random_number * 3).round,
    parity: (SecureRandom.random_number * 2).round - 1,
    prompt: Faker::Lorem.sentence(8)
  )
end

