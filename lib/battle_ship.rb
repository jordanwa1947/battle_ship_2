
require './lib/game_play'

class BattleShip
  def initialize
    @game_play = GamePlay.new
  end

  def welcome
   puts 'Welcome to BATTLESHIP

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?
    >'
    user_input(gets.chomp)
  end

  def user_input(option)
    if option == 'p'
      @game_play.game_play
    elsif option == 'i'
      'rules'
    elsif option == 'q'
      'break'
    else
      'not a valid option'
    end
  end
end

battle_ship = BattleShip.new
battle_ship.welcome
