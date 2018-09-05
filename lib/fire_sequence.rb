require './lib/board_setup'
require './lib/validate_coords'
require 'pry'

class FireSequence

  def initialize(player_fire_range, player_board, validate_coords,
                 computer_ships, computer_coords, computer_logic,
                                    coords2_array, coords3_array)
      @player_fire_range = player_fire_range
      @player_board = player_board
      @validate_coords = validate_coords
      @computer_ships = computer_ships
      @computer_logic = computer_logic
      @comp_coords = computer_coords
      @coords3_array = coords3_array
      @coords2_array = coords2_array
  end

  def validate_player_coord
    coord = gets.chomp.upcase
    valid_invalid = @validate_coords.board_coords.include?(coord)
    valid_coord = coords_must_be_valid(valid_invalid, coord)
    valid_coord
  end

  def coords_must_be_valid(valid_invalid, coord)
    while valid_invalid == false
      puts "sorry, that's not a valid coordinate"
      coord = gets.chomp.upcase
      valid_invalid = @validate_coords.board_coords.include?(coord)
    end
    coord
  end

  def player_fire(coord)
    @validate_coords.board_coords.delete(coord)
    if @comp_coords[0].include?(coord) or @comp_coords[1].include?(coord)
      puts 'Hit!'
      @player_fire_range.update_board(coord, 'H')
      delete_coords(coord)
      @player_fire_range.display_board
    else
      puts 'You Missed'
      @player_fire_range.update_board(coord, 'M')
      @player_fire_range.display_board
    end
  end

  def delete_coords(coord)
    @comp_coords[0].delete(coord)
    @comp_coords[1].delete(coord)
    if_player_sinks_a_ship
  end

  def if_player_sinks_a_ship
    if @comp_coords[0].empty? and @comp_coords[1].empty?
      puts 'You Won!'
    elsif @comp_coords[0].empty?
      puts 'You Sank My 2 Unit Ship!'
    elsif @comp_coords[1].empty?
      puts 'You Sank My 3 Unit Ship!'
    else
      return
    end
  end

  def computer_fire(potential_choices, choices_hash, checker_board_hash)
    comp_coord = computer_chooses(potential_choices)
    @computer_ships.board_coords.delete(comp_coord)
    did_the_computer_miss_or_hit(comp_coord, choices_hash, checker_board_hash)
  end

  def did_the_computer_miss_or_hit(comp_coord, fire_hash, checker_board_hash)
    if @coords3_array.include?(comp_coord) or @coords2_array.include?(comp_coord)
      @player_board.update_board(comp_coord, 'H')
      puts 'I Hit'
      if_computer_sinks_ship(comp_coord)
      @player_board.display_board
      filter_choices(comp_coord, fire_hash)
    else
      @player_board.update_board(comp_coord, 'M')
      puts 'I Missed'
      @player_board.display_board
      filter_choices(comp_coord, checker_board_hash)
    end
  end

  def computer_chooses(potential_choices)
    if potential_choices == nil
      comp_coord = @computer_ships.board_coords.sample
    else
      comp_coord = potential_choices.sample
      comp_coord = @computer_ships.board_coords.sample if comp_coord == nil
      comp_coord
    end
  end

  def filter_choices(hit, choices_hash)
    @computer_ships.board_coords.find_all do |coord|
      choices_hash[hit].include?(coord)
    end
  end

  def choice_logic(coord)
    index = @computer_ships.board_coords.index(coord)
    @computer_logic.hit_logic_hub(index, coord)
  end

  def fire_choices
    choice_hash = {}
    @computer_ships.board_coords.each do |coord|
      choice_hash[coord] = choice_logic(coord)
    end
    choice_hash
  end

  def checker_choices
    choice_hash = {}
    @computer_ships.board_coords.each do |coord|
      choice_hash[coord] = checker_board_pattern(coord)
    end
    choice_hash
  end

  def checker_board_pattern(coord)
    index = @computer_ships.board_coords.index(coord)
    @computer_logic.checker_logic_hub(index, coord)
  end

  def if_computer_sinks_ship(comp_coord)
    @coords2_array.delete(comp_coord)
    @coords3_array.delete(comp_coord)
    if_the_computer_won
  end

  def if_the_computer_won
    if @coords2_array.empty? and @coords3_array.empty?
      puts 'I Won!'
      puts 'Sorry about to loss champ'
    elsif @coords2_array.empty?
      puts 'I Sank Your 2 Unit Ship!'
    elsif @coords3_array.empty?
      puts 'I Sank Your 3 Unit Ship!'
    else
      return
    end
  end

  def computers_turn
    puts "Now it's My turn; press c to continue."
    input = gets.chomp
    while input != 'c'
      input = gets.chomp
    end
  end

  def player_wins
    if @comp_coords[0].empty? and @comp_coords[1].empty?
      puts 'You Won!'
      return true
    end
  end

  def detecting_the_end
    comp_ship_hits = (!(@comp_coords[0].empty?) or !(@comp_coords[1].empty?))
    player_ship_hits = (!(@coords2_array.empty?) or !(@coords3_array.empty?))
    comp_ship_hits and player_ship_hits
  end

  def fire_sequence
    choices_hash = fire_choices
    checker_hash = checker_choices
    potential_choices = nil
    fire_until_the_end(potential_choices, choices_hash, checker_hash)
  end

  def fire_until_the_end(potential_choices,choices_hash, checker_hash)
    while detecting_the_end
      puts 'Choose a coordinate to fire at'
      valid_coord = validate_player_coord
      player_fire(valid_coord)
      break if player_wins
      computers_turn
      potential_choices = computer_fire(potential_choices, choices_hash, checker_hash)
    end
  end
end
