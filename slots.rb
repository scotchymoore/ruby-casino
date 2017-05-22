class Slots
  def initialize(player, user_wallet)
    puts "Welcome to Slots!!"
    puts "#{player.name} you have a balance of #{user_wallet}."
  end

  @aquisition_array =
  [
    "cherry, cherry, cherry"
    "cherry, peach, apple"
    "cherry, apple, peach"
    "apple, apple, apple"
    "apple, peach, cherry"
    "peach, apple, cherry"
    "peach, peach, peach"
  ]

  def print_menu
    puts "Enter *pull* to spin or *quit* to exit"
    choice = gets.strip

    if choice.downcase == 'quit'
      puts "--Thanks for playing--"
      exit
    elsif choice == 'pull'
      puts "Aquiring matches!!"
      sleep(2)
    end
  end

  def processing
    puts "Ding!..Ding!..Ding!"
    user-spin = @aquisition_array.sample
    puts user-spin

    if (user-spin == "cherry, cherry, cherry") || (user-spin == "peach, peach, peach") || (user-spin == "apple, apple, apple")
      puts "You have a match, Winner!!"
      print_menu

    elsif (user-spin == "cherry, peach, apple") || (user-spin == "cherry, apple, peach") || (user-spin == "apple, peach, cherry") || (user-spin == "peach, apple, cherry"
    end
  end
end
