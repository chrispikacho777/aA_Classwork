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

    def add_child(child_name)
        child_name.parent = self
    end

    def remove_child(child_name)
        raise 'Not a child' if !self.children.include?(child_name)
        child_name.parent = nil
    end

    def dfs(target)
        return self if self == target

        self.children.each do |child|
            child.dfs(target)
            return target if child == target
        end
    end
    

end
