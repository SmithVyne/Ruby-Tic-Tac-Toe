#!/usr/bin/env ruby

# Do not Edit above this line ----------------------------------------------- Start Below

moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]

puts " "
puts "Welcome to 2020 version of popular X-O Game!"
puts "Let's Play!"

j = 0
i = 0
while i < 9 do
marker = ["X", "O", "X", "O", "X", "O", "X", "O", "X"]
player = ["Player 1","Player 2","Player 1","Player 2","Player 1","Player 2", "Player 1","Player 2","Player 1",]
puts " "
puts "---------------------------------------------------"
puts "#{player[j]} turn (#{marker[j]})"
puts " "
puts "#{moves[0]} | #{moves[1]} | #{moves[2]}"
puts "----------"
puts "#{moves[3]} | #{moves[4]} | #{moves[5]}"
puts "----------"
puts "#{moves[6]} | #{moves[7]} | #{moves[8]}"
puts " "
print "Choose your position from available numbers: "
player_input = gets.chomp
puts player_input
player_input = player_input.to_i - 1
moves[player_input] = marker[j]
i += 1
j += 1
end

# If the player entered an unexpected input it will give an error "wrong Input, try again!".
# The unexpected input is any input other than the remaining available numbers from range 1-9.
# This action will be applied practically in the third milestone.

puts " "
puts "--------------------------------------------------"
puts "Final Result"
puts "#{moves[0]} | #{moves[1]} | #{moves[2]}"
puts "----------"
puts "#{moves[3]} | #{moves[4]} | #{moves[5]}"
puts "----------"
puts "#{moves[6]} | #{moves[7]} | #{moves[8]}"
puts " "

puts "**********************"
puts "The score is:"
puts "Player 1 [1]"
puts "Player 2 [0]"
puts "**********************"

puts " "
puts "OR"
puts " "

puts "**********************"
puts "IT IS A DRAW!"
puts "**********************"