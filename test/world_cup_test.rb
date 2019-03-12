require "minitest/autorun"
require "./lib/player"
require "./lib/team"
require "./lib/world_cup"
require "pry"

class WorldCupTest < Minitest::Test

  def setup
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia = Team.new("Croatia")
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @world_cup = WorldCup.new(2018, [@france, @croatia])

  end
  def test_has_teams
    assert_equal [@france, @croatia], @world_cup.teams

  end

  def test_has_year
    assert_equal 2018, @world_cup.year
  end



  def test_active_players_by_position
    assert_equal [@pogba, @modric], @world_cup.active_players_by_position("midfielder")
    @croatia.eliminated = true
    assert_equal [@pogba], @world_cup.active_players_by_position("midfielder")
  end



end
