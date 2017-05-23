require 'pry'
require 'colorize'
require 'artii'

require_relative 'player'
require_relative 'heads-tails'
require_relative 'slots'
require_relative 'black_jack'
require_relative 'high_low'

greeting = Artii::Base.new
puts greeting.asciify('CASINO')

class Casino
  attr_accessor :player, :user_wallet
  def initialize
    puts "Welcome to our Ruby Casino!"
    @player = Player.new
    casino_menu
  end

  def casino_menu
    playing = true
    while playing
      puts "Game Menu:\n1)Heads or Tails\n2)Blackjack\n3)Slots\n4)High Low\n5)Go to Casino locations\n6)Bankroll\n7)Exit"
      menu_input = gets.to_i
      case menu_input
      when 1
        HeadsTails.new(@player)
      when 2
        BlackJack.new(@player)
      when 3
        Slots.new(@player)
      when 4
        HighLow.new(@player)
      when 5
        locations_menu
      when 6
        bankroll_method
      when 7
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
end


Casino.new
