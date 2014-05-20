class MockBoard
  attr_accessor :spaces,
                :filled_board

  def spaces
    @spaces = [nil] * 9
  end

  def fill(move, board)
    @filled_board = true
  end
end
