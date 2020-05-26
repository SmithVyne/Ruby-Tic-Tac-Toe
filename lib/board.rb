# rubocop:disable Style/StringLiterals
class Board
  def initialize(moves)
    puts " "
    puts "#{moves[0]} | #{moves[1]} | #{moves[2]}"
    puts "----------"
    puts "#{moves[3]} | #{moves[4]} | #{moves[5]}"
    puts "----------"
    puts "#{moves[6]} | #{moves[7]} | #{moves[8]}"
    puts " "
  end
end
# rubocop:enable Style/StringLiterals
