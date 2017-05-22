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
    HeadsTails.new(@player)
  end
end

Casino.new
