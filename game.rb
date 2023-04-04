puts "Let's play Tic Tac Toe. This game requires two players. Please enter name of the first player."
first_player_name = gets.chomp
puts "Thank you. Now, please, enter name of the second player. "
second_player_name = gets.chomp

grid = " 1 | 2 | 2
---+---+---"
3.times{puts grid}
