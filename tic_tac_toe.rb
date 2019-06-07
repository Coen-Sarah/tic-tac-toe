#[[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
class TicTacToe
private
attr_accessor :game_over, :board
    def initialize
        @game_over = false
        @tied = false
        @winner = nil
    end
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

        if @tiles.key?(@move_array[0]) == false || @tiles.key?(@move_array[1]) == false || @move_array.length != 2
            puts "Please select a valid space"
            player
        end
    end

    def player_one
        player
        if @board[@tiles[@move_array[0]]][@tiles[@move_array[1]]] == " "
            
            @board[@tiles[@move_array[0]]][@tiles[@move_array[1]]] = "X"
        else
            puts "Space already taken. Please select a new space"
            puts " "
            player_one
        end
        print_board

    end
    
    def player_two
        player
        if @board[@tiles[@move_array[0]]][@tiles[@move_array[1]]] == " "
            @board[@tiles[@move_array[0]]][@tiles[@move_array[1]]] = "O"
        else
            puts "Space already taken. Please select a new space"
            puts " "
            player_two
        end
        print_board
    end

    def end_game
        if @tied == false
            puts "#{@winner} won the game! Good job #{@winner}" 
        else
            puts "Tied Game. There is no winner."
        end
        exit
    end

    def horizontal_win
        @board.each do |row|
            if row.all?("X")
                @winner = "Player One"
                @game_over = true
            elsif row.all?("O")
                @winner = "Player Two"
                @game_over = true
            else
            end
        end
    end

    def vertical_win
        win_checker_left = []
        win_checker_middle = []
        win_checker_right = []
        win_checker_left.push(@board[0][0], @board[1][0],@board[2][0])
        win_checker_middle.push(@board[0][1], @board[1][1],@board[2][1])
        win_checker_right.push(@board[0][2], @board[1][2],@board[2][2])
        case
        when win_checker_left.all?("X")
            @game_over = true
            @winner = "Player 1"
        when win_checker_left.all?("O")
            @game_over = true
            @winner = "Player 2"
        when win_checker_middle.all?("X")
            @game_over = true
            @winner = "Player 1"
        when win_checker_middle.all?("O")
            @game_over = true
            @winner = "Player 2"
        when win_checker_right.all?("X")
            @game_over = true
            @winner = "Player 2"
        when win_checker_right.all?("O")
            @game_over = true
            @winner = "Player 2"
        else
            win_checker_left.clear
            win_checker_middle.clear
            win_checker_right.clear
        end

    end

    def diagonal_win
        win_check_left = []
        win_check_right = []

        win_check_left.push(@board[0][0], @board[1][1], @board[2][2])
        win_check_right.push(@board[0][2], @board[1][1], @board[2][0])

        case
        when win_check_left.all?("X")
            @game_over = true
            @winner = "Player 1"
        when win_check_left.all?("O")
            @winner = "Player 2"
            @game_over = true
        when win_check_right.all?("X")
            @winner = "Player 1"
            @game_over = true
        when win_check_right.all?("O")
            @winner = "Player 2"
            @game_over = true
        else #no winner
        end
    end
    def tie
            @board.each do |row| 
                @tied = row.none?(" ")
            end
            if @tied == true
                @game_over = true
            end
    end

    def end_conditions
        
        horizontal_win
        vertical_win
        diagonal_win

        if @game_over == true
            end_game
        end

        tie
        
        if @game_over == true
            end_game
        end
    end

    def round
        player_one
        end_conditions
        player_two
        end_conditions
        round
    end
public
    def game_start
        board
        round
    end

end

game = TicTacToe.new

#game.game_start