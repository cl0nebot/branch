require 'spec_helper'

describe Profile do
  describe "coordinate calculation" do
    it "should average xcoordinates and save" do
      profile = Profile.create
      xvals = 0

      10.times do |n|
        Answer.create(value: n*10, axis: 0, profile_id: profile.id)
        xvals += n * 10
      end
      
      profile.reload
      profile.calculate_coords!

      profile.xcoord.should eq(xvals/10)
      profile.ycoord.should eq(0)
    end

    it "should average ycoordinates and save" do
      profile = Profile.create
      yvals = 0

      10.times do |n|
        Answer.create(value: n*10, axis: 1, profile_id: profile.id)
        yvals += n * 10
      end
      
      profile.reload
      profile.calculate_coords!

      profile.ycoord.should eq(yvals/10)
      profile.xcoord.should eq(0)
    end

    it "should cache coords unless specified" do
      profile = Profile.create
      yvals = 0

      10.times do |n|
        Answer.create(value: n*10, axis: 1, profile_id: profile.id)
        yvals += n * 10
      end

      profile.reload
      coords = profile.coords

      Answer.create(value: 30, axis: 1, profile_id: profile.id)
      profile.reload
      profile.calculate_coords!

      profile.ycoord.should_not eq(yvals/10)
      profile.coords.should eq(coords)
    end

  end

  describe "searching for like profiles" do
    describe "in square area" do
      it "should find all profiles within an area" do
        profiles_in = []
        profiles_out = []

        leftx = 50
        rightx = 70
        topy = 10
        bottomy = -10

        center_x = (leftx + rightx)/2
        center_y = (topy + bottomy)/2

        5.times do
          random = SecureRandom.random_number
          p = Profile.create(
            xcoord: (random * 20 + leftx).to_i,
            ycoord: (random * 20 + bottomy).to_i 
          )

          profiles_in << p
        end

        5.times do
          random = SecureRandom.random_number
          p = Profile.create(
            xcoord: (random * 20 - leftx).to_i,
            ycoord: (random * 20 + bottomy).to_i
          )

          profiles_out << p
        end

        profiles = Profile.in_square_area(center_x, center_y).load

        profiles_out.each do |profile|
          profiles.include?(profile).should_not be_true
        end

        profiles_in.each do |profile|
          profiles.include?(profile).should be_true
        end
      end
    end
  end

  describe "Matchmaking" do
    describe "match percentage" do
      it "should find appropriate match % for vertical" do
        p1 = Profile.create(
          xcoord: 0,
          ycoord: 0
        )

        p2 = Profile.create(
          xcoord: 0,
          ycoord: 6
        )

        p1.match_percentage(p2).should eq(0.6)
      end

      it "should find appropriate match % for 45 degrees" do
        PI = Math::PI

        p1 = Profile.create(
          xcoord: 0,
          ycoord: 0
        )

        p2 = Profile.create(
          xcoord: Math.cos(PI/4.0) * 6,
          ycoord: Math.sin(PI/4.0) * 6
        )


        # we have to round because PI isn't exactly pi, thus it'll come up a little wrong
        (p1.match_percentage(p2)*10).round.should eq(6)
      end
    end
  end

end
