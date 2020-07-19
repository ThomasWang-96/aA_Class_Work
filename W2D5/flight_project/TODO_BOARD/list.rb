require_relative "item.rb"

class List


    def initialize(label)
        @label = label 
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description = '')
        if  Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)    
            return true
        else
            raise
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index > (@items.length - 1) || index < 0
            return false
        end
        true
    end
        
    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end
        false
    end

    def [](index)
        if valid_index?(index)
           return @items[index]
        else
           return  nil
        end
    end
    

    def priority
        @items[0]
    end

    def print
        puts "-------------------------------------------------"
        puts @label.upcase
        puts "-------------------------------------------------"
        puts 'Index'.ljust(7) + '|'.ljust(2) +  'Item'.ljust(13) + '|'.ljust(2)  + 'Deadline'.ljust(13) +  '|'.ljust(2) + 'Done'.ljust(5)
        puts "-------------------------------------------------"
        @items.each_with_index do |item, idx|
            puts "#{idx}".ljust(7) + '|'.ljust(2)  + item.title.ljust(13) + '|'.ljust(2)  + item.deadline.ljust(13) + '|'.ljust(2) + item.done_status.ljust(6)
        end
        return nil
    end

    def print_full_item(index)
        puts "---------------------------------------"
        puts @items[index].title.ljust(18) + @items[index].deadline.ljust(5) + @items[index].done_status
        puts @items[index].description
    end


    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount = 1)
            amount.times do
                @items[index], @items[index - 1] = @items[index - 1], @items[index]
                index -= 1
                break if index == 0
            end
        p "finished switching, asshole"
    end

    def down(index, amount = 1)
        amount.times do
            @items[index], @items[index + 1] = @items[index + 1], @items[index]
            index += 1
            break if index == @items.length - 1
        end
        p "finished switching, asshole"
    end



    def sort_by_date!
        @items.sort_by! { |ele| ele.deadline }
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        if index < 0 || index > @items.length
            return false
        else
            @items.delete_at(index)
            return true
        end
    end

    def purge
        # i = 0
        # while i < @list.length - 1
        #     if @list[i]
        #         @list.delete_at(i)
        #         i = 0
        #     end
        #     i += 1
        # end

        @items.select! {|item| !item.done}
        
    end


    

end
