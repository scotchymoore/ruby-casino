require 'pry'
require 'colorize'
require 'artii'

require_relative 'player'
require_relative 'heads-tails'
require_relative 'slots'
require_relative 'black_jack'
require_relative 'high_low'

greeting = Artii::Base.new
puts greeting.asciify('CASINO').yellow

`say "Hello, Welcome to our wonderful casino. My name is Steven Hawkings, and i endorse this establishment"`

class Casino
  attr_accessor :player, :user_wallet
  def initialize
    puts "Welcome to Ruby Casino!!!!!".yellow
    @player = Player.new
    casino_menu
  end

  def casino_menu
    playing = true
    while playing
      puts "Game Menu:\n1)Heads or Tails\n2)Blackjack\n3)Slots\n4)High Low\n5)Go to Casino locations\n6)Bankroll\n7)Exit".yellow
      menu_input = gets.to_i
      case menu_input
      when 1
        `say "Lets play Heads or Tails"`
        HeadsTails.new(@player)
      when 2
        `say "Lets play BlackJack"`
        BlackJack.new(@player)
      when 3
        `say "Lets play Slots"`
        Slots.new(@player)
        when 4
          `say "Lets play High or Low"`
        HighLow.new(@player)
      when 5
        locations_menu
      when 6
        bankroll_method
      when 7
        `say "Thanks, for playing. Goodbye"`
        exit
      else
        puts "Invalid input. Please try again."
        casino_menu
      end
    end
  end

  def bankroll_method
    puts "Hello #{player.name}! The amount you have left in your wallet is $#{player.wallet.amount}"
    puts "Would you like to:\n1)Add more money\n2)Exit to menu"
    bankroll_input = gets.to_i
    if bankroll_input == 1
      add_to_bankroll
    elsif bankroll_input == 2
      casino_menu
    end
  end

  def add_to_bankroll
    puts "Please input the amount you would like to add to your wallet:"
    add_to_bankroll_input = gets.to_f
    puts "Your new balance is: $#{add_to_bankroll_input + @player.wallet.amount}."
    @player.wallet.amount = add_to_bankroll_input += @player.wallet.amount
    puts "1)Exit to menu"
    input = gets.to_i
    if input == 1
      casino_menu
    else
      puts "Invalid choice. You have been returned to the menu."
      casino_menu
    end
  end

  def locations_menu
    puts "Where would you like to go?\n1)Bar\n2)Restaurant\n3)Pool\n4)Main menu".yellow
    choice = gets.to_i
    case choice
    when 1
      bar
    when 2
      restaurant
    when 3
      pool
    when 4

    else
      puts "Invalid. Please try again."
    end
  end

  def bar

    bar_scenarios = [
      {scene:"Got into a bar fight. Pay fee to get out of jail", money: -200},
      {scene:"Got into a bar fight.", money: -100},
      {scene:"You danced on the bar.", money: 100},
      {scene:"You bet on a pool game.", money: 150},
      {scene: "You bought shots for everyone at the bar", money: -200},
      {scene: "You meet a stripper", money: -500},
      {scene: "You get hit on at the bar and get a phone number", money: 5},
      {scene: "You find a $100 bill on bathroom floor", money: 100},
      {scene: "You convince someone you are a celebrity and they buy you drinks", money: 200}
]
    random_bar = bar_scenarios.sample
      if random_bar[:money] > 0
        puts "#{random_bar[:scene]} You gained $#{random_bar[:money]}."
        @player.wallet.amount += random_bar[:money]
        puts "You now have $#{@player.wallet.amount}\n"
      else
        puts "#{random_bar[:scene]} You lost $#{random_bar[:money]}"
        @player.wallet.amount += random_bar[:money]
        puts "You now have $#{@player.wallet.amount}\n"
      end


      locations_menu
  end

  def restaurant

    rest_scenarios = [
    {scene:"You enjoy all you can eat buffet.", money: -10},
    {scene:"You lose your wallet.", money: -200},
    {scene:"You danced on the table.", money: 100},
    {scene:"You ate the Old 96er and finished it. Impressive!", money: 150},
    {scene: "You win a pie eating contest", money: 200},
    {scene: "You meet a stripper", money: -500},
    {scene: "You get hit on by the waitress and get a free meal", money: 10},
    {scene: "You find a $100 bill on bathroom floor", money: 100},
  ]

    random_rest = rest_scenarios.sample
      if random_rest[:money] > 0
        puts "#{random_rest[:scene]} You gained $#{random_rest[:money]}."
        @player.wallet.amount += random_rest[:money]
        puts "You now have $#{@player.wallet.amount}\n"
      else
        puts "#{random_rest[:scene]} You lost $#{random_rest[:money]}"
        @player.wallet.amount += random_rest[:money]
        puts "You now have $#{@player.wallet.amount}\n"
      end


      locations_menu
  end

  def pool

    pool_scenarios = [
    {scene:"You rent a cabana to take a nap.", money: -100},
    {scene:"You jump in the pool and lose your wallet.", money: -200},
    {scene:"You hang out with a celebrity.", money: 100},
    {scene:"You win wet t-shirt contest. Impressive!", money: 500},
    {scene: "You are too drunk in pool. Lifegaurd saves you", money: -200},
    {scene: "You meet a stripper", money: -500},
    {scene: "You order bottle service by the pool", money: -300},
    {scene: "You find a $100 bill on bathroom floor", money: 100},
    {scene: "You go skinny dipping. BUSTED. Pay fee to get out of jail", money: 500}
  ]

    random_pool = pool_scenarios.sample
      if random_pool[:money] > 0
        puts "#{random_pool[:scene]} You gained $#{random_pool[:money]}."
        @player.wallet.amount += random_pool[:money]
        puts "You now have $#{@player.wallet.amount}\n"
      else
        puts "#{random_pool[:scene]} You lost $#{random_pool[:money]}"
        @player.wallet.amount += random_pool[:money]
        puts "You now have $#{@player.wallet.amount}\n"
      end
      locations_menu
  end
end



Casino.new
