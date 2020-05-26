# rubocop:disable Style/StringLiterals, Style/WordArray
class Players
  attr_accessor :players_moves
  attr_reader :players, :players_mark
  def initialize
    @players = ["Player_1", "Player_2"]
    @players_mark = ["X", "O"]
    @players_moves = [[], []]
  end
end
# rubocop:enable Style/StringLiterals, Style/WordArray
