class HighLow
  def initialize (player)
    puts "Welcome to High-Low #{player.name}!"
    puts "You have a balance of #{player.wallet.amount}."
    @player = player
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
    
  end
