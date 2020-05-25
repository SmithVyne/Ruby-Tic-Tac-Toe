#!/usr/bin/env ruby

# Do not Edit above this line ----------------------------------------------- Start Below
game_on = true

# rubocop:disable Style/StringLiterals, Metrics/LineLength, Style/WordArray, Lint/UnneededDisable, Lint/RedundantCopDisableDirective, Naming/MethodParameterName
players = ["Player_1", "Player_2"]
players_mark = ["X", "O"]
players_moves = [[], []]
moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
filled = []

# times_won = [[], []]
def board(moves) # rubocop:disable Metrics/AbcSize
  puts " "
  puts "#{moves[0]} | #{moves[1]} | #{moves[2]}"
  puts "----------"
  puts "#{moves[3]} | #{moves[4]} | #{moves[5]}"
  puts "----------"
  puts "#{moves[6]} | #{moves[7]} | #{moves[8]}"
  puts " "
end

def has_won?(x) # rubocop:disable Naming/PredicateName
  win = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  win.any? do |e|
    e.all? do |element|
      x.any?(element)
    end
  end
end

puts "Welcome"
puts "ENTER 'exit' TO STOP GAME ANYTIME"
i = 0
while game_on && filled.count < 9
  current_player = players[i]
  current_player_mark = players_mark [i]

  puts " "
  puts "---------------------------------------------------"
  puts "#{current_player} turn (#{current_player_mark})"

  board(moves)
  print 'Choose your position from available numbers: '
  player_input = gets.chomp
  game_on = false if player_input == 'exit'
  player_input = player_input.to_i - 1
  var = if player_input.is_a?(Integer) && (0..8).any?(player_input) && filled.none?(player_input)
          moves[player_input] = current_player_mark

          players_moves[i] << player_input
          filled << player_input
        end

  if has_won?(players_moves[i])
    game_on = false
    puts " "
    puts "Hurray, #{current_player} has won"
    # times_won[i] << "won"
    puts "**********************"
    puts "The score is:"
    puts "#{current_player} [1]"
    puts "#{players[1 - i]} [0]"
    puts "**********************"
    board(moves)
  end

  if var
    i = 1 - i
  else
    puts "\nCHOOSE A VALID POSITION FROM THE BOARD"
  end
  # p players_moves
end

if filled.count == 9
  puts " "
  puts "**********************"
  puts "IT IS A DRAW!"
  puts "**********************"
  board(moves)
end
# rubocop:disable Style/StringLiterals, Metrics/LineLength, Style/WordArray, Lint/UnneededDisable, Lint/RedundantCopDisableDirective, Naming/MethodParameterName
