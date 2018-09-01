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
    expected ='==========='
    '. 1 2 3 4'
    'A'
    'B'
    'C'
    'D'
    '==========='
    actual = board.display_board

    assert_equal expected, actual
  end

  def test_that_the_board_can_be_updated
    board = BoardSetup.new
    board.update_board('b3')
    board.update_board('D1')
    board.update_board('a2')
    board.update_board('C4')
    expected = '==========='
    '. 1 2 3 4'
    'A   #    '
    'B     #  '
    'C       #'
    'D #      '
    '==========='

    assert_equal expected, board.display_board
  end
end
