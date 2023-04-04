WINNING_COMBINATION = [[1,2,3], [1,4,7], [7,8,9], [4,5,6], [2,5,8], [1,5,9], [3,5,7]]

class Player

  attr_reader :name, :result
  attr_accessor :turn

  def initialize(name)
    @name = name
    @turn = false
    @result = []
  end

  def your_turn
    @turn = true
  end

  def wait_for_turn
    @turn = false
  end
end

puts "Let's play Tic Tac Toe. This game requires two players. Please enter name of the first player."
first_players_name = gets.chomp
puts "Thank you. Now, please, enter name of the second player. "
second_players_name = gets.chomp

first_player = Player.new(first_players_name)
second_player = Player.new(second_players_name)


puts "#{first_player.name} is playing with X and #{second_player.name} is playing with O. "

p first_player.result
grid_array = [1,2,3,4,5,6,7,8,9]

grid_array.each_with_index do |number, index|
  index_new = index + 1
  if index_new % 3 == 0 && index_new != 9
    print " #{number}"
    puts
    print "---+---+---"
    puts
  elsif index_new == 9
    print " #{number}"
  else
    print " #{number} |"
  end
end

puts "Choose place"
choise = gets.chomp.to_i
if grid_array.include?(choise)
  first_player.result << choise
  grid_array[choise - 1] = "X"
else
  puts "Wrong"
end




