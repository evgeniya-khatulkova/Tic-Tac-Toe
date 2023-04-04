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

puts "Hello, #{first_player.name} and #{second_players_name}"

grid = " 1 | 2 | 2
---+---+---"
3.times{puts grid}
