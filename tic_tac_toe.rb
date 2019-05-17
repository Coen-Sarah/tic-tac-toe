
class TicTacToe

    
    def print_board
        @board.each do |row|
            print puts row.each { |tile| tile }.join("|")
        end
    end
    def board
        @board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
        @tiles = {
            "top"    => 0,
            "middle" => 1,
            "bottom" => 2,
            "left"   => 0,
            "right"  => 2
        }
        print_board
    end

    def player
        puts "Please pick where you want to place your piece using a 'row column' format."
        puts "For example: top middle, middle middle, or bottom right"
        @move = gets.chomp.downcase
        @move_array = @move.split(" ")
        # split @move and find all hash values equal to
    end
# need to remove ability of players to overwrite each other
    def player_one
        player
        @board[@tiles[@move_array[0]]][@tiles[@move_array[1]]] = "X"
        print_board

    end
    
    def player_two
        player
        @board[@tiles[@move_array[0]]][@tiles[@move_array[1]]] = "O"
        print_board
    end

    def end_game
        #puts winner
        #ends game
    end

    def end_conditions
        #checks all end conditions
        #calls end_game if conditions are met
    end

    def round
        #calls player_one
        #calls player_two
        #calls end_conditions
        #calls round again
        round
    end

end

game = TicTacToe.new
game.board
game.player_one
game.player_two