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
      profile.zcoord.should eq(0)
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
      profile.zcoord.should eq(0)
    end

    it "should average zcoordinates and save" do
      profile = Profile.create
      zvals = 0

      10.times do |n|
        Answer.create(value: n*10, axis: 2, profile_id: profile.id)
        zvals += n * 10
      end
      
      profile.reload
      profile.calculate_coords!

      profile.zcoord.should eq(zvals/10)
      profile.xcoord.should eq(0)
      profile.ycoord.should eq(0)
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

  describe "Matchmaking" do
    describe "match percentage" do
      it "should find appropriate match % for vertical" do
        p1 = Profile.create(
          xcoord: 0,
          ycoord: 0,
          zcoord: 0
        )

        p2 = Profile.create(
          xcoord: 0,
          ycoord: 6,
          zcoord: 0
        )

        (p1.match_percentage(p2)*100).floor.should eq(98)
      end

      it "should find appropriate match % for 45 degrees" do
        PI = Math::PI

        p1 = Profile.create(
          xcoord: 0,
          ycoord: 0,
          zcoord: 0
        )

        p2 = Profile.create(
          xcoord: Math.cos(PI/4.0) * 25,
          ycoord: Math.sin(PI/4.0) * 25,
          zcoord: Math.sin(PI/4.0) * 25
        )


        # we have to round because PI isn't exactly pi, thus it'll come up a little wrong
        (p1.match_percentage(p2)*100).floor.should eq(92)
      end
    end
  end

end
