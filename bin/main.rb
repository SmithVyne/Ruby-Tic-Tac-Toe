#!/usr/bin/env ruby

# Do not Edit above this line ----------------------------------------------- Start Below
# rubocop:disable Style/StringLiterals, Metrics/LineLength, Style/WordArray, Lint/UnneededDisable, Lint/RedundantCopDisableDirective, Naming/MethodParameterName, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/MethodLength, Metrics/CyclomaticComplexity, Style/Documentation

module Gameprops
  def has_won?(x) # rubocop:disable Naming/PredicateName
    win = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    win.any? do |e|
      e.all? do |element|
        x.any?(element)
      end
    end
  end
end

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

class Game
  include Gameprops
  attr_accessor :game_on, :players, :players_mark, :players_moves, :moves, :filled
  def initialize
    @game_on = true
    @players = ["Player_1", "Player_2"]
    @players_mark = ["X", "O"]
    @players_moves = [[], []]
    @moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @filled = []
    puts "Welcome"
    puts "ENTER 'exit' TO STOP GAME ANYTIME"
  end

  def play
    i = 0
    while game_on && filled.count <= 9
      current_player = players[i]
      current_player_mark = players_mark[i]
      puts " "
      puts "---------------------------------------------------"
      puts "#{current_player} turn (#{current_player_mark})"
      Board.new(moves)
      print 'Choose your position from available numbers: '
      player_input = gets.chomp
      self.game_on = false if player_input == 'exit'
      player_input = player_input.to_i - 1
      var = if player_input.is_a?(Integer) && (0..8).any?(player_input) && filled.none?(player_input)
              moves[player_input] = current_player_mark

              players_moves[i] << player_input
              filled << player_input
            end
      if has_won?(players_moves[i])
        self.game_on = false
        puts " "
        puts "Hurray, #{current_player} has won"
        puts "**********************"
        puts "The score is:"
        puts "#{current_player} [1]"
        puts "#{players[1 - i]} [0]"
        puts "**********************"
        Board.new(moves)
      elsif filled.count == 9 && !has_won?(players_moves[i]) # rubocop:disable Style/GuardClause
        self.game_on = false
        puts " "
        puts "**********************"
        puts "IT IS A DRAW!"
        puts "**********************"
        Board.new(moves)
      end

      if var
        i = 1 - i
      else
        puts "\nCHOOSE A VALID POSITION FROM THE BOARD"
      end
    end
  end
end
# rubocop:enable Style/StringLiterals, Metrics/LineLength, Style/WordArray, Lint/UnneededDisable, Lint/RedundantCopDisableDirective, Naming/MethodParameterName, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/MethodLength, Metrics/CyclomaticComplexity, Style/Documentation

game = Game.new
game.play
