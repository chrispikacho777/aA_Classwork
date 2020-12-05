class PolyTreeNode
    
    attr_reader :value, :children
    attr_accessor :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(name)
        return if @parent == name
        @parent.children.delete(self) if @parent
        @parent = name
        if @parent != nil
            name.children << self  
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_name)
        raise 'Not a child' if !self.children.include?(child_name)
        child_name.parent = nil
    end

    def dfs(target)
        return self if self.value == target

        self.children.each do |child|
            solution = child.dfs(target)
            return solution unless solution == nil
        end
        nil
    end

    def bfs(target)
        checker = [self]
        until checker.empty?
            checker.each do |node|
                return node if node.value == target
                checker += node.children
                checker.shift
            end
        end
        nil
    end
    

end
