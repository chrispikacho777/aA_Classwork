class PolyTreeNode
    
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(name)
        @parent = name
        name.children << self if !@name.children.include?(self) && name != nil
    end

end
