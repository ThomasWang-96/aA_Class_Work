require 'disc'

describe Disc do

    let(:disc) { Disc.new(4) }
    
    describe "#intitalize" do 
        it "should take in a number as an argument for size" do
           disc
        end

        it "should set @size to be the input size" do
            size = disc.instance_variable_get(:@size)
            expect(size).to eq(4)
        end

    end
    
end

