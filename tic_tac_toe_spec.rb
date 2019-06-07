require './tic_tac_toe.rb'
RSpec.describe TicTacToe do
    game = TicTacToe.new
    describe '#board' do
        it "should print the starting board" do
            expect(game.board).to eql([[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]])
        end
    end

    describe '#horizontal_win' do
        it "should set @game_over == true" do 
            game.game_over = false
            game.board = [["X", "X", "X"], [" ", " ", " "], [" ", " ", " "]]
            game.horizontal_win
            expect(game.game_over).to eql(true)
        end
        it "should have @game_over == false" do 
            game.game_over = false
            game.board = [["O", "O", "X"], [" ", " ", " "], [" ", " ", " "]]
            game.horizontal_win
            expect(game.game_over).to eql(false)
        end
    end
    describe '#vertical_win' do
        it "should set game_over == to true" do
            game.game_over = false
            game.board = [["O", " ", " "], ["O", " ", " "], ["O", " ", " "]]
            game.vertical_win
            expect(game.game_over).to eql(true)
        end
        it "should should have game_over == false" do 
            game.game_over = false
            game.board = [["O", " ", " "], ["X", " ", " "], ["O", " ", " "]]
            game.vertical_win
            expect(game.game_over).to eql(false)
        end
    end
    describe '#diagonal_win' do
        it "should set game_over == true" do
            game.game_over = false
            game.board = [["X", " ", " "], [" ", "X", " "], [" ", " ", "X"]]
            game.diagonal_win
            expect(game.game_over).to eql(true)
        end
        it "should have game_over == false" do 
            game.game_over = false
            game.board = [["X", " ", " "], [" ", "O", " "], [" ", " ", "X"]]
            game.diagonal_win
            expect(game.game_over).to eql(false)
        end
    end
end