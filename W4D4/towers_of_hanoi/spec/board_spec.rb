require 'board'

describe Board do
    let(:board) {Board.new}
    let(:disc1) {Disc.new(1)}
    let(:disc2) {Disc.new(2)}
    let(:disc3) {Disc.new(3)}

    describe "#initialize" do
    
        it "should set @piles as a 2D array with 3 rows" do
            piles = board.instance_variable_get(:@piles)
            expect(piles.length).to eq(3)        
        end
        
        it "should have discs stored in first array" do
            piles = board.instance_variable_get(:@piles)
            expect(piles[0]).to eq([:disc1,:disc2,:disc3])
        end
        
        it "should leave the other two arrays empty" do
            expect(piles[1]).to eq([])
            expect(piles[2]).to eq([])
        end        
    end

    describe "#move(start,end)" do
        
        it "should take two indices from 0 to 2" do
            board.move(0, 1)
        end

        it "should not allow moving from empty pile" do
            expect {board.move(1, 2)}.to raise_error("Invalid move!")
        end

        context "first allows moving disc from pile one to another" do
            before do
                board.move(0,1)
            end
            
            it "should remove the top disc from the first pile" do
                expect(piles[0]).to eq([:disc2,:disc3])
            end

            it "should add the disc to the specified pile" do
                expect(piles[1]).to eq([:disc1])
            end

        end
        
        
        it "does not allow putting larger disc on top of smaller disc" do 
            before do
                board.move(0,1)
            end    
            expect {board.move(0,1)}.to raise_error("Invalid move!")
        end 

    end

    describe "#win?" do
        # context "all  discs should be in last pile with size ascending " do
        #     expect(pile[2]).to eq([:disc1,:disc2,:disc3])
        # end

        it "should return a boolean" do 
            expect(!!board.win?).to eq(board.win?)
        end

        it "should return true if the player has won" do
            board.instance_variable_set(:@piles,[[],[],[:disc1,:disc2,:disc3]])
            expect (board.win?).to eq true
        end

        it 'shoulde return false if the player has not won' do 
            board.instance_variable_set(:@piles,[[:disc3],[:disc2,:disc1],[]])
            expect (board.win?).to eq false
        end

    end

end
