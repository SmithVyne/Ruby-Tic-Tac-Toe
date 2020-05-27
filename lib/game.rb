class Game
  include Gameprops
  attr_accessor :game_on, :players_moves, :moves, :filled
  attr_reader :players, :players_mark
  def initialize
    @game_on = true
    player_class = Players.new
    @players = player_class.players
    @players_mark = player_class.players_mark
    @players_moves = player_class.players_moves
    @moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @filled = []
    welcome_message
  end

  def play # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    i = 0
    while game_on && filled.count <= 9
      current_player = players[i]
      current_player_mark = players_mark[i]
      start_game(current_player, current_player_mark, moves)
      player_input = input
      self.game_on = false if player_input == 'exit'
      var = check_input(player_input, moves, current_player_mark, players_moves, filled, i)
      if won?(players_moves[i])
        self.game_on = false
        winner?(current_player, players, moves, i)
      elsif filled.count == 9 && !won?(players_moves[i])
        self.game_on = false
        draw?(moves)
      end
      i = 1 - i if var
    end
  end
end
