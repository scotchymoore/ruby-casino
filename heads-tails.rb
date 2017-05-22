class HeadsTails
  def initialize(player, user_wallet)
    puts "Welcome to Heads Tails!"
    puts "#{player.name} you have a balance of #{user_wallet}."
    puts "How much would you like to bet?"
    bet_amount = gets.to_f
    puts "You have placed a bet of #{bet_amount}. Is this correct?\n1)Yes\n2)No"
    input = gets.to_i
    if input == 1
      ht_game_method
    elsif input == 2
      "Please try again."
      HeadsTails.new
    else
      puts "I am sorry that is invalid input. Please try again."
      HeadsTails.new
    end
  end
end
