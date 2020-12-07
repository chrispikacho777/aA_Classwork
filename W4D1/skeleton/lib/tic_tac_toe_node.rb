require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if self.board.over?
      return true if self.board.winner != evaluator && self.board.won?
      return false 
    end

    if @next_mover_mark == evaluator
      self.children.all? {|child| child.losing_node?(evaluator)}
    else
      self.children.any? {|child| child.losing_node?(evaluator)}
    end

  end

  def winning_node?(evaluator)
    if self.board.over?
      return true if self.board.winner == evaluator && self.board.won?
      return false 
    end

    if @next_mover_mark == evaluator
      self.children.any? {|child| child.winning_node?(evaluator)}
    else
      self.children.all? {|child| child.winning_node?(evaluator)}
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    next_move_arr = []

    (0...3).each do |r|
      (0...3).each do |c|
        if board.empty?([r,c])
          new_board = board.dup
          new_board[[r,c]] = next_mover_mark
          next_mover_mark == :o ? next_mark = :x : next_mark = :o
          node = TicTacToeNode.new(new_board, next_mark, [r,c])
          next_move_arr << node
        end
      end
    end
    next_move_arr
  end
end
