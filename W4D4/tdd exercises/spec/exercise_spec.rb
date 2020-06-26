require 'exercise'

describe Array do
    
    describe "#uniq" do
        it "removes duplicates" do 
            expect([1, 2, 1, 3, 3].uniq).to eq ([1, 2, 3])
        end
    end

    describe "#two_sum" do 
        it "finds all pairs of positions where the elements sum to zero" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq ([[0, 4], [2, 3]])
        end
        it "returns positions in order" do 
            expect([-1, 1, 1].two_sum).to eq ([[0,1],[0,2]])
            expect([-1, 0, 2, -2, 1].two_sum).to_not eq ([[2, 3],[0, 4]])
            expect([-1, -1, 1].two_sum).to_not eq ([[2,1],[0,2]])
        end
    end

    describe "#my_transpose" do
        
        
        it "turn the rows into columns" do
            arr = [[0, 1, 2], [3, 4, 5],[6, 7, 8]]    
            expect(arr.my_transpose).to eq ([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
        end

        it "should return an array with exchanged indices" do
            arr = [[0, 1, 2], [3, 4, 5],[6, 7, 8]] 

            expect(arr[0][1]).to eq (arr.my_transpose[1][0])
            expect(arr[2][1]).to eq (arr.my_transpose[1][2])
        end
    end 

    

end


describe "#stock_picker(arr)" do
    

    it "should take in a array of stock prices as an argument" do
        arr = [30, 35, 42, 23, 18, 50]
        stock_picker(arr) 
    end

    it "should return the most profitable pair" do
        arr = [30, 35, 42, 23, 18, 50]
        expect(stock_picker(arr)).to eq ([4, 5])
    end

    it "buying day should be earlier than selling day" do 
        arr = [30, 35, 42, 23, 18, 50]
        expect(stock_picker(arr)[0] < stock_picker(arr)[1]).to be true
    end

end






