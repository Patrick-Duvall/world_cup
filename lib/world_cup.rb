class WorldCup
  attr_reader :year, :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def players_by_position(position)
      @teams.map{ |team| team.players_by_position(position)}.flatten
  end

  def active_players_by_position(position)
    eliminated_teams = @teams.select{|team|team.eliminated }
    eliminated_players = eliminated_teams.map{|team|team.players}.flatten
    players_by_position(position) - eliminated_players
  end

  def all_players_by_position
    players = Hash.new
    team_players = @teams.map(&:players).flatten
    team_players.each do |player|
       if !players[player.position]
          players[player.position] = [player]
        else
          players[player.position] << player
        end
    end
    players
  end


end
