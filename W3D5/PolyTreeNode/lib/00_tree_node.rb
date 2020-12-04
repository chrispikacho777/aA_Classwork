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
end
