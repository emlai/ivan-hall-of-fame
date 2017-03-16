require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  test "should not save score without player, points, or character" do
    assert_not Score.new(points: 666, character: "Igor").save
    assert_not Score.new(player: players(:igor), character: "Igor").save
    assert_not Score.new(player: players(:igor), points: 666).save
  end
end
