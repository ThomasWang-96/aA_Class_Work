require_relative "list.rb"

class TodoBoard

    def initialize
        # @list = List.new(label)
        @hash = {}
    end


    

    def get_command

        print "\nEnter a command: "

        command, list, *args = gets.chomp.split(' ')

        case command

        #general command

        when "mklist" 
            @hash[list] = List.new(list)
        when 'showall'
            @hash.each do |k, v|
                 v.print
            end
        when 'ls'
            @hash.each_key do |key|
                puts key
            end
        when 'quit'
            return false



        #list command
        when 'mktodo'
            @hash[list].add_item(*args)       
        
        when "up"
            args.map! { |arg| arg.to_i }
            @hash[list].up(*args)
        
        when "down"
            args.map! { |arg| arg.to_i }
            @hash[list].down(*args)
        
        when "swap"
            args.map! { |arg| arg.to_i }
            @hash[list].swap(*args)
        
        when "sort"
            @hash[list].sort_by_date!
        
        when "priority"
            @hash[list].print_priority
        
        when "print" 
            if args.length == 0
                @hash[list].print
            else
                args.map! { |arg| arg.to_i }
                @hash[list].print_full_item(*args)
            end
        
        when "toggle"
             args.map! { |arg| arg.to_i }
             @hash[list].toggle_item(*args)
        when "rm"
            args.map! { |arg| arg.to_i }
            @hash[list].remove_item(*args)
        when "purge"
            @hash[list].purge

        error
        else
            print 'Sorry, that command is not recognized'
        end

        true
    end

    def run
        while self.get_command != false
            self.get_command
        end
    end





        
    end



TodoBoard.new

#Simply create and #run an instance of TodoBoard at the bottom of todo_board.rb. Then you can execute your app with a simple ruby todo_board.rb from the terminal.



