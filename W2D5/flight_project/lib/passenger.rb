class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(str)
        if @flight_numbers.include?(str.upcase) || @flight_numbers.include?(str.downcase)
            return true
        else
            return false
        end
    end

    def add_flight(flight_num)
        if !has_flight?(flight_num)
            @flight_numbers << flight_num.upcase
        end
    end


    
end