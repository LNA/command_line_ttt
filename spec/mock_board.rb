class MockBoard
  attr_accessor :spaces,
                :filled_board,
                :resets_board

  def spaces
    @spaces = [nil] * 9
  end

  def fill(move, board)
    @filled_board = true
  end

  def reset
    @resets_board = true
  end
end
