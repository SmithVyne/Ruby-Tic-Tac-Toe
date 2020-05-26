class Board
  attr_reader :display_board
  def initialize(moves)
    @display_board = "\n#{moves[0]} | #{moves[1]} | #{moves[2]} \n----------\n#{moves[3]} | #{moves[4]} | #{moves[5]}\n----------\n#{moves[6]} | #{moves[7]} | #{moves[8]}\n \n" # rubocop:disable Metrics/LineLength
  end
end
