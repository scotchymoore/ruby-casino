require_relative 'deck'

class BlackJack
  attr_accessor :deck, :player, :bet

  def initialize(player)
    @player = player
    @deck = Deck.new.shuffle_cards

    # get all cards from deck - @deck.cards

    # to get a random card out of the deck - @deck.cards.sample
    main_black_jack
  end

  def place_bet
    puts "How much do you want to bet? "
    @bet = gets.to_i
    if bet > @player.wallet.amount
      puts "Sorry sir. You can't bet what you don't have. Try a lower amount."
      place_bet
    else bet <= @player.wallet.amount
      puts "All bets are down. They can't be changed."
      deal
    end
  end

  def deal
    puts "Let me shuffle the cards."
    puts "Dealer is now dealing.\n\n"
    dealer_cards = @deck.sample(2)
    dc = dealer_cards[0]
      puts "Dealer has #{dc.rank} of #{dc.suit}"
    dealer_value = dealer_cards.inject(0) { |total, card| total += card.value.to_i }
    player_cards = @deck.sample(2)
    @player_value = 0
    @player_value = player_cards.inject(0) { |total, card| total += card.value.to_i }

    puts "--------------------------------"
     player_cards.each do |pc|
       puts "You have #{pc.rank} of #{pc.suit}"
     end

    puts "#{player.name} has #{@player_value}\n\n"

    if @player_value == 21
      "\n\nBlackjack!  Winner Winner Chicken Dinner!\n"
      winning_amount = bet* 2
      @player.wallet.amount = @player.wallet.amount + winning_amount
      puts "#{player.name}, you just won $#{winning_amount}."
      puts "You now have $#{@player.wallet.amount}.\n"
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
      hit_or_stay
    end
  end

def hit
  new_card = @deck.sample
  ncv = new_card.value.to_i
  nv = @player_value += ncv
  puts "You got a #{new_card.rank} of #{new_card.suit}"
  puts "You have #{nv}. "
  if nv < 21
    hit_or_stay
  elsif nv == 21
    "\n\nBlackjack!  Winner Winner Chicken Dinner!\n"
    winning_amount = @bet* 2
    @player.wallet.amount = @player.wallet.amount + winning_amount
    puts "#{player.name}, you just won $#{winning_amount}."
    puts "You now have $#{@player.wallet.amount}.\n"
  else
    puts "You LOSE!  House wins!"
    @player.wallet.amount = @player.wallet.amount - @bet
    puts " You lost $#{@bet}.  You now have $#{@player.wallet.amount} left."
    main_black_jack
  end
end

def end_of_game


end

  def main_black_jack
    puts "Do you want to play?
    1. Yes
    2. No"
    play = gets.to_i
    case play
    when 1
      puts "Well alright then, grab a seat and lets play."
      place_bet
    when 2
      puts "Thanks for stopping by but I only talk to players. The all you can eat buffet is over there."
      casino_menu
    else
      puts "I said are you going to play or leave.  Make up your mind!"
      main_black_jack
    end
  end

  def play_again
    puts "Do you want to play again?
    1. Yes
    2. No"
    play = gets.to_i
    case play
    when 1
      puts "Well alright then, grab a seat and lets play."
      place_bet
    when 2
      puts "Thanks for stopping by, it was fun while it lasted."
      casino_menu
    else
      puts "I said are you going to play or leave.  Make up your mind!"
      play_again
    end
  end
end
