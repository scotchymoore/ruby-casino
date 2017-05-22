require 'pry'
require 'colorize'

require_relative 'player'



class Casino
  attr_accessor :player
  def initialize
    puts "Welcome to our Ruby Casino!"
    @player = Player.new
    binding.pry
  end
end

Casino.new
