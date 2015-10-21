'''
R > S
S > P
P > R
'''
class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  # [ "Armando", "P" ]
  def self.winner(player1, player2)
    # YOUR CODE HERE
    if !Array['R', 'S', 'P'].include?player1[1] or !Array['R', 'S', 'P'].include?player2[1]
      raise NoSuchStrategyError, 'Strategy must be one of R,P,S'
    end
    if player1[1] == 'R'
      if player2[1] == 'R' or player2[1] == 'S'
        return player1
      end
      if player2[1] == 'P'
        return player2
      end
    end

    if player1[1] == 'S'
      if player2[1] == 'P' or player2[1] == 'S'
        return player1
      end
      if player2[1] == 'R'
        return player2
      end
    end

    if player1[1] == 'P'
      if player2[1] == 'P' or player2[1] == 'R'
        return player1
      end
      if player2[1] == 'S'
        return player2
      end
    end

  end

  # [
  #   [
  #       [ ["Armando", "P"], ["Dave", "S"] ],
  #       [ ["Richard", "R"], ["Michael", "S"] ]
  #   ],
  #   [
  #       [ ["Allen", "S"], ["Omer", "P"] ],
  #       [ ["David E.", "R"], ["Richard X.", "P"] ]
  #   ]
  # ]
  # 如果测试用例格式是上面的统一格式,可以通过,如果像测试用例1则需添加第二行的if 但是该算法鲁棒性太差
  def self.tournament_winner(tournament)
    # YOUR CODE HERE
    if tournament[0][0].is_a?(String) && tournament[1][0].is_a?(String)
      return self.winner(tournament[0], tournament[1])
    end
    player_list = Array.new
    tournament.each { |val|
      player_list.push(self.winner(val[0][0], val[0][1]))
      player_list.push(self.winner(val[1][0], val[1][1]))
    }
    len = player_list.length
    while len > 1
      player1 = player_list.pop
      player2 = player_list.pop
      winner = self.winner(player1, player2)
      player_list.push(winner)
      len = player_list.length
    end
    return player_list.pop
  end

end

tour = Array[
  [
      [ ["Armando", "P"], ["Dave", "S"] ],
      [ ["Richard", "R"], ["Michael", "S"] ]
  ],
  [
      [ ["Allen", "S"], ["Omer", "P"] ],
      [ ["David E.", "R"], ["Richard X.", "P"] ]
  ]
]

# puts "#{RockPaperScissors.tournament_winner(tour)}"
