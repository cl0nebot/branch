require "spec_helper"

describe Voter do
  describe "calculate heat" do
    it "cools with time" do
      voter1 = Voter.new(100,0,Time.now)
      voter2 = Voter.new(100,0,1.day.ago)
      heat1 = voter1.calculate_heat
      heat2 = voter2.calculate_heat

      expect(heat1).to be > heat2
    end
  end

  describe "calculate confidence" do
  end
end
