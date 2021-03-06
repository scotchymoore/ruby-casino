require_relative 'deck'


class BlackJack
  attr_accessor :deck, :player, :bet

  def initialize(player)
    greeting = Artii::Base.new
    puts greeting.asciify('BLACK JACK').red
    @player = player
    @deck = Deck.new.shuffle_cards
    puts "Welcome to Black Jack!\n"
    `say -v "Lee" "Welcome to Black Jack  I'm Lee and I will be your dealer.  Lets have some fun"`
    # get all cards from deck - @deck.cards

    # to get a random card out of the deck - @deck.cards.sample
    main_black_jack
  end

  def main_black_jack
    puts "\nDo you want to play?
    1. Yes
    2. No"
    `say -v "Lee" "Do you want to play"`
    play = gets.to_i
    case play
    when 1
      puts "Well alright then, grab a seat and lets play."
      `say -v "Lee" "Well alright then, grab a seat and lets play."`
      place_bet
    when 2
      puts "Thanks for stopping by but I only talk to players. The all you can eat buffet is over there."
      `say -v "Lee" "Thanks for stopping by but I only talk to players. The all you can eat buffet is over there."`
    else
      puts "I said are you going to play or leave.  Make up your mind!"
      `say -v "Lee" "I said are you going to play or leave.  Make up your mind!"`
      main_black_jack
    end
  end

  def play_again
    puts "\n\nDo you want to play again?
    1. Yes
    2. No"
    `say -v "Lee" "Do You want to play again"`
    play = gets.to_i
    case play
    when 1
      puts "Well alright then, grab a seat and lets play."
      `say -v "Lee" "That's the spirit. No one likes a quitter"`
      place_bet
    when 2
      puts "Thanks for stopping by, it was fun while it lasted.\n\n"
      `say -v "Lee" "We can't all be winners. you might have better luck at another game"`
    else
      puts "I said are you going to play or leave.  Make up your mind!"
      play_again
    end
  end

  def place_bet
    puts "How much do you want to bet? "
    @bet = 0
    @bet = gets.to_i
    if @bet > @player.wallet.amount
      puts "Sorry sir. You can't bet what you don't have. Try a lower amount."
      place_bet
    else @bet <= @player.wallet.amount
      puts "All bets are down. They can't be changed."
      deal
    end
  end

  def deal
    puts "Let me shuffle the cards."
    puts "Dealer is now dealing.\n\n"
    @dealer_cards = @deck.sample(2)
    dc = @dealer_cards[0]
      puts "Dealer has #{dc.rank} of #{dc.suit}"
    @dealer_value = @dealer_cards.inject(0) { |total, card| total += card.value.to_i }
    player_cards = @deck.sample(2)
    @player_value = 0
    @player_value = player_cards.inject(0) { |total, card| total += card.value.to_i }

    puts "--------------------------------"
     player_cards.each do |pc|
       puts "You have #{pc.rank} of #{pc.suit}"
     end

    puts "#{player.name} has #{@player_value}\n\n"

    if @player_value == 21
      puts "\n\nBlackjack!  Winner Winner Chicken Dinner!\n".green
      `say -v "Lee" "Black Jack! Winner Winner Chicken Dinner"`
      winning_amount = bet* 2
      @player.wallet.amount = @player.wallet.amount + winning_amount
      puts "#{player.name}, you just won $#{winning_amount}."
      puts "You now have $#{@player.wallet.amount}.\n"
      play_again
    else
    hit_or_stay
  end
end

def hit_or_stay
    puts "Do you want to hit or stay?
    1. Hit
    2. Stay"
    hit_stay = gets.to_i
    case hit_stay
    when 1
      hit
    when 2
      puts "So you are done. Lets see what I have "
      end_of_game
    else
      puts "Did I stutter? Do you want to hit or stay?"
      `say -v "Lee" "Did I stutter? Do you want to hit or stay?"`
      hit_or_stay
    end
  end

def hit
  new_card = @deck.sample
  ncv = new_card.value.to_i
  @player_value += ncv
  puts "You got a #{new_card.rank} of #{new_card.suit}"
  puts "You have #{@player_value}. "
  if @player_value < 21
    hit_or_stay
  elsif @player_value == 21
    winning_amount = @bet* 3
    @player.wallet.amount = @player.wallet.amount + winning_amount
    puts "\n\nBlackjack!  Winner Winner Chicken Dinner!\n".green
    `say -v "Lee" "Black Jack! Winner Winner Chicken Dinner"`
    puts "#{player.name}, you just won $#{winning_amount}."
    puts "You now have $#{@player.wallet.amount}.\n"
    play_again
  else
    puts "You LOSE!  House wins!".green
    `say -v "Lee" "You went over. you lose. I thought you said you were good at this"`
    @player.wallet.amount = @player.wallet.amount -= @bet
    puts " You lost $#{@bet}.  You now have $#{@player.wallet.amount} left."
    play_again
  end
end

def end_of_game
  puts "The dealer has"
  @dealer_cards.each do |pc|
    puts "Dealer has #{pc.rank} of #{pc.suit}"
  end
    puts "The Dealer has #{@dealer_value}"
    if @dealer_value < 17
      dealer_hit
      if @dealer_value == 21
        puts "You LOSE!  House wins!".yellow
        @player.wallet.amount = @player.wallet.amount -= @bet
        puts " You lost $#{@bet}.  You now have $#{@player.wallet.amount} left."
        play_again

      elsif @dealer_value > 21
        puts "You won!".green
        `say -v "Lee" "Boo yah Player wins"`
        @player.wallet.amount = @player.wallet.amount += (@bet * 2)
        puts " You won $#{@bet}.  You now have $#{@player.wallet.amount} left."
        play_again
      elsif @dealer_value > @player_value
        puts "You LOSE!  House wins!".yellow
        @player.wallet.amount = @player.wallet.amount -= @bet
        puts " You lost $#{@bet}.  You now have $#{@player.wallet.amount} left."
        play_again
      elsif @player_value > @dealer_value
        puts  "You won!".green
        `say -v "Lee" "Nice job here is your winnings"`
        @player.wallet.amount = @player.wallet.amount += (@bet * 2)
        puts " You won $#{@bet}.  You now have $#{@player.wallet.amount} left."
        play_again
      else @player_value == @dealer_value
        puts "Its a push.  No winner or loser.".red
        puts "Lets play again."
        `say -v "Lee" "Aw Crikey a push  no winner lets play again"`
        play_again
      end
    else
      if @dealer_value == 21
        puts "You LOSE!  House wins!".yellow
        `say -v "Lee" "Tough break for you. Great for me"`
        @player.wallet.amount = @player.wallet.amount -= @bet
        puts " You lost $#{@bet}.  You now have $#{@player.wallet.amount} left."
        play_again
      elsif @dealer_value > 21
        puts "You won!".green
        `say -v "Lee" "You got lucky"`
        @player.wallet.amount = @player.wallet.amount += (@bet * 2)
        puts " You won $#{@bet}.  You now have $#{@player.wallet.amount} left."
        play_again
      elsif @dealer_value > @player_value
        puts "You LOSE!  House wins!".yellow
        `say -v "Lee" "Dealer wins. I like you that you don't get tired of losing"`
        @player.wallet.amount = @player.wallet.amount -= @bet
        puts " You lost $#{@bet}.  You now have $#{@player.wallet.amount} left."
        play_again
      elsif @player_value > @dealer_value
        puts  "You won!".green
        `say -v "Lee" "We have winner"`
        @player.wallet.amount = @player.wallet.amount += (@bet * 2)
        puts " You won $#{@bet}.  You now have $#{@player.wallet.amount} left."
        play_again
      else @player_value == @dealer_value
        puts "Its a push.  No winner or loser."
        puts "Lets play again."
        `say -v "Lee" "Aw Crikey a push  no winner lets play again"`
        play_again
      end
  end
end


  def dealer_hit
  new_card = @deck.sample
  ncv = new_card.value.to_i
  @dealer_value += ncv
  puts "The Dealer got a #{new_card.rank} of #{new_card.suit}"
  puts "The Dealer has #{@dealer_value}. "
    if @dealer_value < 17
      dealer_hit
    end
  end



end
