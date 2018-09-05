
require './lib/game_play'

class BattleShip
  def initialize
    @game_play = GamePlay.new
  end

  def welcome
   puts "Welcome to BATTLESHIP

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?
    >"
    user_input(gets.chomp)
  end

  def user_input(option)
    if option == 'p'
      @game_play.game_play
    elsif option == 'i'
      display_instructions
    elsif option == 'q'
      return
    else
      'not a valid option'
    end
  end

  def display_instructions
    new_file = File.open('./data/instructions.txt', "r")
    display = new_file.read
    display.each_line do |line|
    puts line
    end
    break_from_instructions
  end

  def break_from_instructions
    option = gets.chomp
    if option == 'b'
      welcome
    elsif option == 'q'
      return
    else
      puts 'not a valid option'
      break_from_instructions
    end
  end
end

battle_ship = BattleShip.new
battle_ship.welcome
