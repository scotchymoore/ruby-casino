require 'pry'
require 'colorize'

require_relative 'player'
require_relative 'heads-tails'
require_relative 'slots'

class Casino
  attr_accessor :player, :user_wallet
  def initialize
    puts "Welcome to our Ruby Casino!"
    @player = Player.new
    @@user_wallet = @player.wallet.amount
    casino_menu
  end

  def casino_menu
    #Casino options
    #Game options
    #Bankroll
    #Quit
      puts """Game Menu:\n1)Heads or Tails\n2)Blackjack\n3)Slots\n4)Roulette
5)Go to Casino locations\n6)Bankroll\n7)Exit"""
    menu_input = gets.to_i
    case menu_input
      when 1
        HeadsTails.new(@player, @@user_wallet)
      when 2
        blackjack.new(@player, @@user_wallet)
      when 3
        Slots.new(@player, @@user_wallet)
      when 4
        roulette.new(@player, @@user_wallet)
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
    @@user_wallet = add_to_bankroll_input + @player.wallet.amount
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
