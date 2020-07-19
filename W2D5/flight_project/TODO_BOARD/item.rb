class Item


    def self.valid_date?(string)
        parts = string.split("-")
        if parts[0].length != 4 || parts[1].length != 2 || parts[2].length != 2
            return false
        end
        if parts[1].to_i > 12 || parts[2].to_i > 31
            return false
        end
        true
    end


    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline 
        if  !Item.valid_date?(deadline)
            raise
        end
        @description = description
        @done = false
    end

    def title
        @title
    end

    def done
        @done 
    end


    def deadline
        @deadline
    end

    def description
        @description
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise
        end
        @deadline = new_deadline
    end


    def description=(new_description)
        @description = new_description
    end

    def done_status
        if @done == true
            return "[✓]"
        end
        if @done == false
            return "[ ]"
        end
    end

    def toggle
        if @done == true
            @done = false
            print "done is set to false now"
        else
            @done = true
            print "done is set to true now"
        end
    end


end


# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false


# puts Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# puts Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# puts Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# )