require 'pry'

require_relative 'deck'

class HighLow
  attr_accessor :bet_amount, :player_count

  def initialize (player)
    puts "Welcome to High or Low #{player.name}!"
    puts "You have a balance of #{player.wallet.amount}."
    puts "You must get 5 consecutive correct to win."
    @player = player
    @player_count = 0
    bet
  end

  def bet
    puts "How much would you like to bet?"
    @bet_amount = gets.to_f
    if @bet_amount > @player.wallet.amount
      puts "I am sorry, you do not have that much money. Please try again"
      bet
    end
    puts "You have placed a bet of #{bet_amount}. Is this correct?\n1)Yes\n2)No"
    input = gets.to_i
    if input == 1
      game_method
    elsif input == 2
      puts "Please try again."
      bet
    else
      puts "I am sorry that is invalid input. Please try again."
      bet
    end
  end

  def game_method
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    a = numbers.sample
    b = numbers.sample
    while @player_count < 5
    puts "The high number is #{numbers.last} and the low is #{numbers.first}\nThe first number is..."
    sleep (2)
    puts "#{a}\n1)Higher\n2)Lower"
    input = gets.to_i
    if a > b
      if input == 1
        puts "Congrats! Your number is #{b}."
        @player_count += 1
      else
        puts "Sorry! Your number is #{b}."
        HighLow.new(@player)
      end
    end
    if a < b
      if input == 2
        puts "Congrats! Your number is #{b}."
        @player_count += 1
      else
        puts "Sorry! Your number is #{b}."
        HighLow.new(@player)
      end
    end
    end
  end
end
