require '00_tree_node.rb'

class KnightPathFinder

    MOVES = [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]

    def self.valid_moves(pos)
        x, y = pos
        valid_pos = []
        MOVES.each do |shift|
            new_x = x+shift[0]
            new_y = y+shift[1]
            valid_pos << [new_x, new_y] if new_x.between?(0,7) && new_y.between?(0,7) && !considered_positions.include?([new_x, new_y])
        end
        @considered_positions += valid_pos
        valid_pos
    end

    def initialize(pos)
        @root_node = pos
        @paths = PolyTreeNode.new(@root_node)
        @considered_positions = [] 
    end
    
    def new_move_positions
    end
end    
