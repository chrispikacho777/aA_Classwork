require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    root_node = TicTacToeNode.new(game.board, mark)
    child_nodes = root_node.children
    child_nodes.each do |child|
      return child.prev_move_pos if child.winning_node?(mark) 
    end

    child_nodes.each do |child|
      return child.prev_move_pos if !child.losing_node?(mark)
    end

    raise "No non-losing node found"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
