class Player
  attr_reader :name, :result
  attr_accessor :winner

  def initialize(name)
    @name = name
    @winner = false
    @result = []
  end

  def win?
    @winner
  end

  def you_won!
    @winner = true
  end
end
