require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    next_move_arr = []

    (0...3).each do |r|
      (0...3).each do |c|
        if @board.empty?([r,c])
          new_board = @board.dup
          new_board[[r,c]] = @next_mover_mark
          node = TicTacToeNode.new(new_board, new_board[@prev_move_pos], [r,c] )
          next_move_arr << node
        end

      end
    end
    next_move_arr

  end
end
