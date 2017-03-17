require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  test_entry = "killed by a puppy's dirty attack below the belt in underwater tunnel level 1"

  test "should save score without player" do
    assert Score.new(points: 666, character: "Igor", entry: test_entry).save
  end

  test "should not save score without points, character, or entry" do
    assert_not Score.new(player: players(:igor), character: "Igor", entry: test_entry).save
    assert_not Score.new(player: players(:igor), points: 666, entry: test_entry).save
    assert_not Score.new(player: players(:igor), points: 666, character: "Igor").save
  end
end
