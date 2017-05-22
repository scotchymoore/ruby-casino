require 'pry'

class Slots
  def initialize(player, user_wallet)
    puts "Welcome to Slots!!"
    puts "#{player.name} you have a balance of #{user_wallet}."
    place_bets
  end



  def place_bets
    puts "How much would you like to bet?"
    amount = gets.to_f
    puts "You have placed a bet of #{amount}. Is this correct?\n1)Yes\n2)No"
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
    puts "Enter *pull* to spin or *quit* to exit"
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
    puts "Ding!..Ding!..Ding!"
    user_spin = aquisition_array.sample
    puts user_spin

    if (user_spin == "cherry, cherry, cherry") || (user_spin == "peach, peach, peach") || (user_spin == "apple, apple, apple")
      puts "You have a match, Winner!!"
      print_menu

    elsif (user_spin == "cherry, peach, apple") || (user_spin == "cherry, apple, peach") || (user_spin == "apple, peach, cherry") || (user_spin == "peach, apple, cherry")
      puts "Sorry, try again"
      print_menu
    end
  end
end
