require "./../PolyTreeNode/lib/00_tree_node.rb"
require "byebug"


class KnightPathFinder

    MOVES = [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]

    attr_reader :root_node, :pos, :considered_positions
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
        @pos = pos
        @root_node = PolyTreeNode.new(@pos)
        @considered_positions = [pos] 
    end
    
    def new_move_positions(pos)
        all_moves = KnightPathFinder.valid_moves(pos)
        new_moves = all_moves.select{|move| !@considered_positions.include?(move)}
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree
        queue = [@root_node] ## starts with the root node

        until queue.empty?
            current_node = queue.shift
            self.new_move_positions(current_node.value).each do |new_move| ##calling new_moves on the instance game on the first root to start listing next possible moves
                child = PolyTreeNode.new(new_move)
                current_node.add_child(child)
                queue << child
            end 
        end
        # until self.new_move_positions(@root_node.each).empty?
        #     queue += self.new_move_positions(@root_node)
        # end
    end

    def find_path(end_pos)
        end_node = self.root_node.bfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(node)
        solution = []
        until node.nil?
            solution << node.value
            node = node.parent
        end
        solution.reverse
    end

end    

kpf = KnightPathFinder.new([0, 0])
p kpf.root_node.dfs([6,2])
# p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
#p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

