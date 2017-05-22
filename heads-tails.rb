class HeadsTails
  attr_accessor :bet_amount

  def initialize(player)
    puts "Welcome to Heads Tails #{player.name}!"
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
      side_choice
    elsif input == 2
      puts "Please try again."
      bet
    else
      puts "I am sorry that is invalid input. Please try again."
      bet
    end
  end

  def side_choice
    puts "Choose Heads or Tails.\n1)Heads\n2)Tails"
    side_choice = gets.to_i
    case side_choice
    when 1,2
    ht_game(side_choice)
    else
      puts "Invalid choice, please try again."
      side_choice
  end

  def ht_game(side_choice)
    bet_won = @bet_amount * 2
    coin = rand(2)
    if side_choice == coin && 0
      puts "Congratulations! It is heads!"
      puts "$#{bet_won} have been added to your wallet."
      @player.wallet.amount += bet_won
    elsif side_choice == coin && 2
      puts "Congratulations! It is tails!"
      puts "$#{bet_won} have been added to your wallet."
      @player.wallet.amount += bet_won
    else
      puts "Sorry! The coin landed on #{coin}."
      puts "$#{@bet_amount} has been taken from your wallet."
      @player.wallet.amount -= @bet_amount
    end
  end
end
