require 'game'

describe Game do
    let(:game) {Game.new}
    describe "#initialize" do
        it "should set a board instance" do
            expect(game.instance_variable_get(:@board)).to be_instance_of(Board)
        end
    end


    describe "#play" do
        it "should print 'enter pile numbers to move'" do
            input = double("0 1\n", :chomp=>"0 1")
            allow(game).to receive(:gets).and_return(input)

            expect {game.play}.to output(/enter pile numbers to move/).to_stdout
        end

        it 'should check the win status' do
            expect(game.board).to receive(:win?)
            game.play
        end

        context "should constantly prompt if the player has not win yet" do
            before do
                allow(game.board).to receive(:win?).and_return(false,false,false,false,false,false,true)
             end

            it 'continues to loop' do
                expect(game).to receive(:play).exactly(6).times
                game.play
            end
        end
    end

end


