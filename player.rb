require_relative 'wallet'

class Player
  attr_accessor :name, :age, :gender, :wallet

  def initialize
    #need to think about how to implement the wallet
    # this could(should) be a class
    # or just an attribute on the user
    puts 'What is your name?'
    @name = gets.strip
    puts "What is your age, #{@name}?"
    @age = gets.strip.to_i
    if @age < 21
      puts "I am sorry #{@name}, but you need to be at least 21 to come in here. Get older."
      exit
    end
    # puts "What is your gender, #{@name}?"
    # @gender = gets.strip
    puts 'How much money are you playing with today?'
    amount = gets.to_f
    if amount < 1
      puts "Sorry that is invalid, please try again."
      Player.new
    end
    @wallet = Wallet.new(amount)
  end
end
