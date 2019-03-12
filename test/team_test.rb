require "minitest/autorun"
require "./lib/player"
require "./lib/team"

class TeamTest < Minitest::Test

  def test_has_country
    team = Team.new("France")
    assert_equal "France", team.country
  end

  def test_not_eliminated_by_default
    team = Team.new("France")
    assert_equal false, team.eliminated?
  end

  def test_can_be_eliminated
    team = Team.new("France")
    team.eliminated = true
    assert_equal true, team.eliminated?
  end

  def test_players_starts_empty
    team = Team.new("France")
    assert_equal [], team.players
  end

  def test_can_add_players
    team = Team.new("France")
    team.add_player(Player.new({name:"Bob" ,position: "goalie"}))
    team.add_player(Player.new({name:"Lou" ,position: "midfielder"}))
    assert_equal 2, team.players.length
    assert team.players[0].name == "Bob"
    assert team.players[1].name == "Lou"
    assert team.players[0].position == "goalie"
    assert team.players[1].position == "midfielder"
  end

  def test_can_sort_players_by_position
    team = Team.new("France")
    team.add_player(Player.new("Bob","goalie"))
    team.add_player(Player.new("Lou", "midfielder"))
    team.add_player(Player.new("Ron","defender"))
    team.add_player(Player.new("Callou", "midfielder"))
    team.add_player(Player.new("John","defender"))
    team.add_player(Player.new("Greg", "midfielder"))
    assert_equal 3 , team.players_by_position("midfielder").length
    assert team.players_by_position("midfielder").all?{|player| player.position == "midfielder"}
  end

end
