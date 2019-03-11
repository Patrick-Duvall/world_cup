require "minitest/autorun"
require "./lib/player"

class PlayerTest < Minitest::Test

  def test_has_a_name
    player = Player.new("joe","forward")
    assert_equal "joe", player.name
  end

  def test_has_a_position
    player = Player.new("joe","forward")
    assert_equal "forward", player.position
  end

end
