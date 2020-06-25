class PolyTreeNode
    attr_accessor :value, :parent, :children
    def initialize(value)
        @value = value #value = Thomas
        @parent = nil #Thomas's dad = > PolyTreeNode
        @children = [] #Thomas's kid => PolyTreeNode

    end

    A DD [..]

    def parent=(new_parent) #new_parent = nil
        parent.children.delete(self) if parent != nil
        parent = new_parent
        return if new_parent.nil? #parent = nil
        new_parent.children << self if !new_parent.children.include?(self) 

    end

    def add_child(child_node)
        child_node.parent = self
    end
    
    def remove_child(child_node)
        raise "not a child" if !self.children.include?(child_node)
        child_node.parent = nil  
    end


    def dfs(target_value)
        return nil if self == nil
        return self if self.value == target_value 
        self.children.each do |child|
            search_result = child.dfs(target_value)
            return search_result if search_result != nil
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        while !queue.empty?
            ele = queue.shift
            return ele if ele.value == target_value
            ele.children.each { |child| queue << child }
        end         
    end

end



