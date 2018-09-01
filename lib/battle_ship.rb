class BattleShip

  def welcome
   'Welcome to BATTLESHIP

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?
    >'
  end

  def user_input(option)
    if option == 'p'
      'insert_class'
    elsif option == 'i'
      'instructions'
    elsif option == 'q'
      'break'
    else
      'not a valid option'
    end
  end
end
