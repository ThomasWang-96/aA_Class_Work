require "byebug"
require_relative "polytree_node.rb"
class KnightPathFinder
    attr_reader :considered_positions
    def self.valid_moves(pos)
        valid_moves = [] 
        arr_ops = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
        arr_ops.each do |op|
            new_pos = [pos.first + op.first, pos.last + op.last]
            valid_moves << new_pos if new_pos.first >= 0 && new_pos.first < 8 && new_pos.last >= 0 && new_pos.last < 8
        end
        valid_moves
    end

   
    def initialize(pos)#[0, 0] => children: [2, 1], [1, 2]
        @starting_pos = pos
        @considered_positions = [@starting_pos]
        @root_node = PolyTreeNode.new(pos) 
        
    end

    def new_move_positions(pos) #pos = old_position
        new_positions =  KnightPathFinder.valid_moves(pos).select { |possible_position| !@considered_positions.include?(possible_position) }
        @considered_positions += new_positions
        return new_positions 
    end

    def build_move_tree
        queue = [@root_node]
        while !queue.empty?
            ele = queue.shift
            new_move_positions(ele.value).each do |position|
                new_child = PolyTreeNode.new(position)
                ele.add_child(new_child)
                queue << new_child
            end 
        end   
    end

    def find_path(destination)
        queue = [@root_node]
        while !queue.empty?
            ele = queue.shift
            return ele if ele.value == destination
            ele.children.each {|child| queue << child}
        end  
    end

    def trace_path_back(destination)
        path = []
        queue = [find_path(destination)]
        # debugger
        while !queue.empty?
            # debugger
            ele = queue.shift
            return path.reverse if ele.nil?
            path << ele.value   
            queue << ele.parent 
        end 
    end

end 

a = KnightPathFinder.new([0,0])
# p a.new_move_positions([3, 3])
a.build_move_tree
p a.trace_path_back([6, 2])
