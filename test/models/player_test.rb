require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test "should not save player without name" do
    player = Player.new(password: "secret")
    assert_not player.save
  end

  test "should not save player without password" do
    player = Player.new(name: "Igor")
    assert_not player.save
  end

  test "should save player with name and password but without Attnam username" do
    player = Player.new(name: "Igor2", password: "secret")
    assert player.save
  end

  test "generates no Attnam link if has no Attnam username" do
    player = Player.new(name: "Igor")
    assert_nil player.attnam_link
  end

  test "generates correct Attnam link if has Attnam username" do
    player = Player.new(name: "Igor", attnam_username: "iggy")
    assert_equal player.attnam_link, "https://attnam.com/users/iggy"
  end
end
