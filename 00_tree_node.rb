class PolyTreeNode
    

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        return if self.parent == parent
       
        if self.parent
            self.parent.children.delete(self)
        end

        @parent = parent
        
        parent.children.push(self) unless self.parent.nil?
        self

    end

    def add_child(child_node)
        child_node.parent=self
    end

    def remove_child(child_node)
        if !child_node.nil? && !self.children.include?(child_node)
            raise "error"
        end
        child_node.parent=nil
    end

    def dfs(target)
        if self.value == target
            return self 
        else
            children.each do |child|
                found_value = child.dfs(target)
                return found_value unless found_value.nil?
            end
        end
        nil
    end

    def bfs(target)

        nodes = [self]

        until nodes.empty?
            node = nodes.shift
            return node if node.value == target
            nodes.concat(node.children)
        end

        nil
    end

end