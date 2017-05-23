require 'pry'

class Slots

  attr_accessor :amount

  def initialize(player)
    greeting = Artii::Base.new
    puts greeting.asciify('SLOTS').blue
    puts "Welcome to Slots!!"
    puts "#{player.name} you have a balance of #{player.wallet.amount}."
    @player = player
    place_bets
  end



  def place_bets
    puts "How much would you like to bet?"
    @amount = gets.to_f
    puts "You have placed a bet of #{@amount}. Is this correct?\n1)Yes\n2)No"
    input = gets.to_i

    case input
    when 1
      print_menu
    when  2
      puts "Please try again."
      place_bets
    else
      puts "I am sorry that is an invalid input. Please try again."
      place_bets
    end

  end


  def print_menu
    puts "Enter *pull* to spin or *quit* to exit".green
    choice = gets.strip

    if choice.downcase == 'quit'
      puts "--Thanks for playing--"
      exit
    elsif choice == 'pull'
      puts "Aquiring matches!!"
      sleep(2)
      processing
    end
  end

  def processing
    amount_won = @amount * 2
    aquisition_array =
    [
      "cherry, cherry, cherry",
      "cherry, peach, apple",
      "cherry, apple, peach",
      "apple, apple, apple",
      "apple, peach, cherry",
      "peach, apple, cherry",
      "peach, peach, peach"
    ]
    puts "Ding!".yellow
    sleep(1)
    puts "Ding!".blue
    `say "ding, ding, ding, flashing lights ans such"`
    sleep(1)
    puts "Ding!".red
    sleep(1)
    user_spin = aquisition_array.sample
    puts user_spin

    if (user_spin == "cherry, cherry, cherry") || (user_spin == "peach, peach, peach") || (user_spin == "apple, apple, apple")
      puts "-------------"
      puts "You have a match, Winner!!"
      `say "Wow, you are good"`
      puts "-------------"
      puts "Congratulations, you have won $#{amount_won}."
      @player.wallet.amount += amount_won

    elsif (user_spin == "cherry, peach, apple") || (user_spin == "cherry, apple, peach") || (user_spin == "apple, peach, cherry") || (user_spin == "peach, apple, cherry")
      puts "-------------"
      puts "Sorry, try again"
      `say "loser"`
      puts "-------------"
      puts "$#{@amount} has been taken from your wallet."
      @player.wallet.amount -= @amount
    end
  end
end
