require 'passenger.rb'

class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    
    end


    def full?
         if @capacity <= @passengers.length
            return true 
         else 
            return false
         end
    end


    def board_passenger(passenger)
        if !full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end
        end
    end

    def list_passengers
        new_arr = []
         @passengers.each do |passenger|
            new_arr << passenger.name
         end
         new_arr
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end
