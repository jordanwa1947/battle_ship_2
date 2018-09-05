require './test/help_test.rb'
require './lib/board_setup'

class BoardShipTest < Minitest::Test

  def test_that_the_board_exists
    board = BoardSetup.new
    assert_instance_of BoardSetup, board
  end

  def test_that_board_has_attributes
    board = BoardSetup.new
    assert_equal ". 1 2 3 4", board.two
    assert_equal "===========", board.one
    assert_equal "A        ", board.a

  end

  def test_that_the_board_can_be_printed
    board = BoardSetup.new
    refute board.display_board
  end

  def test_that_the_board_can_be_updated_on_row_a_at_2
    board = BoardSetup.new
    board.update_board('a2', '#')
    expected = 'A   #    '
    actual = board.a

    assert_equal expected, actual
  end

  def test_that_the_board_can_be_updated_on_row_b_at_3
    board = BoardSetup.new
    board.update_board('b3', '#')
    expected = 'B     #  '
    actual = board.b

    assert_equal expected, actual
  end

  def test_that_the_board_can_be_updated_on_row_c_at_4
    board = BoardSetup.new
    board.update_board('c4', '#')
    expected = 'C       #'
    actual = board.c

    assert_equal expected, actual
  end

  def test_that_the_board_can_be_updated_on_row_d_at_1
    board = BoardSetup.new
    board.update_board('d1', '#')
    expected = 'D #      '
    actual = board.d

    assert_equal expected, actual
  end
end
