require '00_tree_node.rb'

class KnightPathFinder


    def self.valid_moves(pos)
        x, y = pos
        valid_pos = []
        root = PolyTreeNode.new(pos)
        root.add_children




    end

    def initialize(pos)
        @root_node = pos
        @paths = PolyTreeNode.new(@root_node)
        @considered_positions = [] 
    end
    
    def new_move_positions
    end
end    
