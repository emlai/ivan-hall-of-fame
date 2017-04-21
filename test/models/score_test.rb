require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  test_entry = "killed by a puppy's dirty attack below the belt in underwater tunnel level 1"

  test "should save score without player" do
    assert Score.new(points: 666, character: "Igor", entry: test_entry, version: versions(:v0509)).save
  end

  test "should not save score without points, character, entry, or version" do
    assert_not Score.new(player: players(:igor), character: "Igor", entry: test_entry, version: versions(:v0509)).save
    assert_not Score.new(player: players(:igor), points: 666, entry: test_entry, version: versions(:v0509)).save
    assert_not Score.new(player: players(:igor), points: 666, character: "Igor", version: versions(:v0509)).save
    assert_not Score.new(player: players(:igor), points: 666, character: "Igor", entry: test_entry).save
  end

  test "should not save score with non-positive points" do
    assert_not Score.new(points: 0, character: "Igor", entry: test_entry, version: versions(:v0509)).save
    assert_not Score.new(points: -1, character: "Igor", entry: test_entry, version: versions(:v0509)).save
  end
end
