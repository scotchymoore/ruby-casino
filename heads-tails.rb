class HeadsTails
  attr_accessor :bet_amount

  def initialize(player)
    puts "Welcome to Heads Tails #{player.name}!".green
    puts "You have a balance of $#{player.wallet.amount}.".green
    @player = player
    bet
  end

  def bet
    puts "How much would you like to bet?".green
    @bet_amount = gets.to_f
    if @bet_amount > @player.wallet.amount
      puts "I am sorry, you do not have that much money. Please try again".green
      bet
    end
    puts "You have placed a bet of $#{bet_amount}. Is this correct?".green
    puts "1)Yes\n2)No".yellow
    input = gets.to_i
    if input == 1
      side_choice
    elsif input == 2
      puts "Please try again.".green
      bet
    else
      puts "I am sorry that is invalid input. Please try again.".green
      bet
    end
  end

  def side_choice
    puts "Choose Heads or Tails.".green
    puts "1)Heads\n2)Tails".yellow
    side_choice = gets.to_i
    case side_choice
    when 1,2
    ht_game(side_choice)
    else
      puts "Invalid choice, please try again.".green
      side_choice
  end
end

  def ht_game(side_choice)
    bet_won = @bet_amount * 2
    coin = rand(2)
    if side_choice == coin + 1
      puts "Congratulations you won!!".green
      puts "$#{bet_won} have been added to your wallet.".green
      @player.wallet.amount += bet_won
      puts "-------------\n-------------\n-------------"
    else
      puts "Sorry! You lost."
      puts "$#{@bet_amount} has been taken from your wallet.".green
      @player.wallet.amount -= @bet_amount
      puts "-------------\n-------------\n-------------"
    end
    puts "1)Play again\n2)Exit to menu".yellow
    user_input = gets.to_i
    if user_input == 1
      HeadsTails.new(@player)
    else

    end
  end
end
