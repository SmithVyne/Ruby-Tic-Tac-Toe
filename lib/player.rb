class Players
  attr_accessor :players_moves
  attr_reader :players, :players_mark
  def initialize
    @players = %w[Player_1 Player_2]
    @players_mark = %w[X O]
    @players_moves = [[], []]
  end
end
