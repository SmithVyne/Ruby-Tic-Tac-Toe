#!/usr/bin/env ruby

# Do not Edit above this line ----------------------------------------------- Start Below
module Gameprops
  def welcome_message
    puts 'Welcome'
    puts "ENTER 'exit' TO STOP GAME ANYTIME"
  end

  def start_game(current_player, current_player_mark, moves)
    puts ' '
    puts '-' * 51
    puts "#{current_player} turn (#{current_player_mark})"
    puts Board.new(moves).display_board
    print 'Choose your position from available numbers: '
  end

  def input
    player_input = gets.chomp
    system 'clear'
    player_input == 'exit' ? 'exit' : player_input.to_i - 1
  end

  def winner?(current_player, players, moves, i)
    puts ' '
    puts "Hurray, #{current_player} has won"
    puts '*' * 22
    puts 'The score is:'
    puts "#{current_player} [1]"
    puts "#{players[1 - i]} [0]"
    puts '*' * 22
    puts Board.new(moves).display_board
  end

  def draw?(moves)
    puts ' '
    puts '*' * 22
    puts 'IT IS A DRAW!'
    puts '*' * 22
    puts Board.new(moves).display_board
  end

  def check_input(player_input, moves, current_player_mark, players_moves, filled, i) # rubocop:disable Metrics/ParameterLists, Metrics/LineLength
    if player_input.is_a?(Integer) && (0..8).any?(player_input) && filled.none?(player_input)
      moves[player_input] = current_player_mark

      players_moves[i] << player_input
      filled << player_input
    else
      puts "\nCHOOSE A VALID POSITION FROM THE BOARD"
      nil
    end
  end

  def won?(x)
    win = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    win.any? do |e|
      e.all? do |element|
        x.any?(element)
      end
    end
  end
end

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

Game.new.play
