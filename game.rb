require_relative 'player'

WINNING_COMBINATION = [[1, 2, 3], [1, 4, 7], [7, 8, 9], [4, 5, 6], [2, 5, 8], [1, 5, 9], [3, 5, 7], [3, 6, 9]]

grid_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def grid_builder(number)
  print " #{number}"
  puts
  print '---+---+---'
  puts
end

def creating_grid(grid_array)
  puts
  grid_array.each_with_index do |number, index|
    index_new = index + 1
    if (index_new % 3).zero? && index_new != 9
      grid_builder(number)
    elsif index_new == 9
      print " #{number}"
    else
      print " #{number} |"
    end
  end
  puts
end

def draw(grid_array)
  if grid_array.none? { |element| (1..9).include?(element) }
    creating_grid(grid_array)
    puts
    puts "It's a draw... "
    end_game
  end
end

def end_game
  puts 'Do you want to play again. y/n?'
  play_again = gets.chomp.downcase
  until play_again.downcase == 'y' || play_again.downcase == 'n'
    puts 'y stands for yes, n for now'
    play_again = gets.chomp
  end
  if play_again == 'y'
    grid_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    game(grid_array)
  end
  exit
end

def game(grid_array)
  puts "  Let's play Tic Tac Toe. This game requires two players. Please enter name of the first player."
  first_players_name = gets.chomp
  puts
  puts 'Thank you. Now, please, enter name of the second player.'
  second_players_name = gets.chomp
  puts

  first_player = Player.new(first_players_name)
  second_player = Player.new(second_players_name)

  puts "#{first_player.name} is playing with - X and #{second_player.name} is playing with - O. "
  puts

  creating_grid(grid_array)

  until second_player.winner == true
    puts
    puts "#{first_player.name}, it is your turn to play, choose the position on the grid"
    choise = gets.chomp.to_i
    until grid_array.include?(choise)
      puts 'Choose another position'
      choise = gets.chomp.to_i
    end
    first_player.result << choise
    grid_array[choise - 1] = 'X'

    if WINNING_COMBINATION.any? do |element|
      element.all? { |letter| first_player.result.include?(letter) }
    end
      first_player.you_won!
      super_winner = second_player
    end

    creating_grid(grid_array)
    puts

    end_game if first_player.winner
    end_game if draw(grid_array)

    puts "#{second_player.name}, it is your turn to play, choose the position on the grid"
    choise = gets.chomp.to_i
    until grid_array.include?(choise)
      puts 'Choose another position'
      choise = gets.chomp.to_i
    end
    second_player.result << choise
    grid_array[choise - 1] = 'O'

    if WINNING_COMBINATION.any? do |element|
      element.all? { |letter| second_player.result.include?(letter) }
    end

      second_player.you_won!
      super_winner = second_player
    end

    end_game if draw(grid_array)

    creating_grid(grid_array)
    puts
  end

  puts "Congrats #{super_winner.name}. You won the game" unless super_winner.nil?
  end_game
end

game(grid_array)
