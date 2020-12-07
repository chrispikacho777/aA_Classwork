require "./../PolyTreeNode/lib/00_tree_node.rb"
require "byebug"


class KnightPathFinder

    MOVES = [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]

    attr_reader :root_node, :paths
    def self.valid_moves(pos)
        x, y = pos
        valid_pos = []
        MOVES.each do |shift|
            new_x = x+shift[0]
            new_y = y+shift[1]
            valid_pos << [new_x, new_y] if new_x.between?(0,7) && new_y.between?(0,7) 
        end
        valid_pos
    end

    def initialize(pos)
        @root_node = pos
        @paths = PolyTreeNode.new(@root_node)
        @considered_positions = [pos] 
    end
    
    def new_move_positions(pos)
        all_moves = KnightPathFinder.valid_moves(pos)
        new_moves = all_moves.select{|move| !@considered_positions.include?(move)}
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree
        queue = [@paths]

        until queue.empty?
            self.new_move_positions(queue.first.value).each do |new_move|
                queue.first.add_child(PolyTreeNode.new(new_move))
                queue << PolyTreeNode.new(new_move)
            end 
            queue.shift 
        end
        # until self.new_move_positions(@root_node.each).empty?
        #     queue += self.new_move_positions(@root_node)
        # end
    end
end    

