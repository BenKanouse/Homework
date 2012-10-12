class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  strategy_one = m1[1]
  strategy_two = m2[1]
  if strategy_one == strategy_two
    m1
  elsif strategy_one == "R" and strategy_two == "P"
    m2
  elsif strategy_one == "R" and strategy_two == "S"
    m1
  elsif strategy_one == "S" and strategy_two == "P"
    m1
  elsif strategy_one == "S" and strategy_two == "R"
    m2
  elsif strategy_one == "P" and strategy_two == "S"
    m2
  elsif strategy_one == "P" and strategy_two == "R"
    m1
  else
    raise NoSuchStrategyError
  end
end

def rps_game_winner(game)
  player_one = game[0]
  player_two = game[1]
  raise WrongNumberOfPlayersError unless game.length == 2
  strategies = ["R", "P", "S"]
  rps_result(player_one, player_two)
end

def rps_tournament_winner(tournament)
  if tournament[0][0].is_a?(String)
    return rps_game_winner(tournament)
  end
  rps_game_winner( [rps_tournament_winner(tournament.first), rps_tournament_winner(tournament.last)]) 
end

