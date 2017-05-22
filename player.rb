

class Player
  attr_accessor :name, :age, :gender

  def initialize
    #need to think about how to implement the wallet
    # this could(should) be a class
    # or just an attribute on the user
    puts 'What is your name player?'
    @name = gets.strip
    puts "What is your age, #{@name}?"
    @age = gets.strip.to_i
    puts "What is your gender, #{@name}?"
    @gender = gets.strip
  end
end
