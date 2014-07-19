require 'test_helper'

class MatcherTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Matcher
  end
end
