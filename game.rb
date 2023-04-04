WINNING_COMBINATION = [[1,2,3], [1,4,7], [7,8,9], [4,5,6], [2,5,8], [1,5,9], [3,5,7]]

class Player

  attr_reader :name, :result

  def initialize(name)
    @name = name
    @result = []
  end

end

puts "Let's play Tic Tac Toe. This game requires two players. Please enter name of the first player."
first_players_name = gets.chomp
puts "Thank you. Now, please, enter name of the second player. "
second_players_name = gets.chomp

first_player = Player.new(first_players_name)
second_player = Player.new(second_players_name)


puts "Hello, #{first_player.name} and #{second_player.name}."

p first_player.result
grid_array = [1,2,3,4,5,6,7,8,9]

grid_array.each_with_index do |number, index|
  if number % 3 == 0 && number != 9
    print " #{number}"
    puts
    print "---+---+---"
    puts
  elsif number == 9
    print " #{number}"
  else
    print " #{number} |"
  end
end
