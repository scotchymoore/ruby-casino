require 'pry'

require_relative 'deck'
# require_relative 'casino'

class HighLow
  attr_accessor :bet_amount, :player_count, :bet_won

  def initialize (player)
    @player = player
    @player_count = 0
    puts "Welcome to High or Low #{player.name}!".green
    puts "You have a balance of #{player.wallet.amount}.".green
    puts "1)To play game\n2)To read rules\n3)Exit to menu".yellow
    choice = gets.to_i
    case choice
    when 1
      bet
    when 2
      rules
    when 3

    else
      puts "Invalid input, please try again.".green
      HighLow.new(@player)
    end
  end

  def rules
    puts """You will be shown a random number between 1-10. You will be
given the choice to pick higher lower. If the next number is the same
as the choice you given of higher or lower, then you will be shown another
number to do the same process. You must guess correctly 4 times in a row
to win.""".green
    puts "Please press 1 to play game.".yellow
    choice = gets.to_i
    if choice == 1
      bet
    else
      puts "Invalid, please try again.".green
      rules
    end
  end

  def bet
    puts "How much would you like to bet?".green
    @bet_amount = gets.to_f
    if @bet_amount > @player.wallet.amount
      puts "I am sorry, you do not have that much money. Please try again".green
      bet
    end
    puts "You have placed a bet of $#{bet_amount}.".green
    puts "Is this correct?\n1)Yes\n2)No".yellow
    input = gets.to_i
    if input == 1
      game_method
    elsif input == 2
      puts "Please try again.".green
      bet
    else
      puts "I am sorry that is invalid input. Please try again.".green
      bet
    end
  end

  def game_method
    @bet_won = @bet_amount * 2
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    a = numbers.sample
    b = numbers.sample
    while @player_count < 1
      puts "The high number is #{numbers.last} and the low is #{numbers.first}\nThe first number is...".green
      sleep (2)
      puts "#{a}\n1)Higher\n2)Lower".yellow
      input = gets.to_i
      if a < b
        if input == 1
          puts "Congrats! Your number is #{b}.".green
          @player_count += 1
          game_method
        else
          puts "Sorry! Your number is #{b}.".green
          puts "You have lost #{bet_amount}".green
          @player.wallet.amount -= @bet_amount
          HighLow.new(@player)
        end
      end
      if a > b
        if input == 2
          puts "Congrats! Your number is #{b}.".green
          @player_count += 1
          game_method
        else
          puts "Sorry! Your number is #{b}.".green
          puts "You have lost #{bet_amount}".green
          @player.wallet.amount -= @bet_amount
          HighLow.new(@player)
        end
      end
      puts "Congratulations! You have won #{@bet_won}.".green
      @player.wallet.amount += @bet_won
      puts "1)Play again\n2)Exit to the menu".yellow
      user_input = gets.to_i
      case user_input
      when 1
        HighLow.new(@player)
      when 2
        @player_count = 4
        puts 'Thanks!'
      end
    end
  end


end
puts 'end'
