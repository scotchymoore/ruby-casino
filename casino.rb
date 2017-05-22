require 'pry'
require 'colorize'

require_relative 'player'
require_relative 'heads-tails'

class Casino
  attr_accessor :player
  def initialize
    puts "Welcome to our Ruby Casino!"
    @player = Player.new
    casino_menu
  end

  def casino_menu
    #Casino options
    #Game options
    #Bankroll
    #Quit
    puts """Game Menu:\n1)Heads or Tails\n2)Blackjack\n3)Slots\n4)Roulette
  5)21\n6)Go to Casino locations\n7)Exit"""
  input = gets.to_i
  case input
  when 1
    HeadsTails.new(@player)
  when 2
    blackjack.new(@player)
  when 3
    slots.new(@player)
  when 4
    roulette.new(@player)
  when 5
    twenty_one.new(@player)
  when 6
    locations_menu
  when 7
    exit
  end
end

Casino.new
