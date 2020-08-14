class Board
  attr_accessor :board
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @winning_scenarios = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  end
  
  def print_board
    puts "
         1   2   3
       -------------
    A  | #{@board[0]} | #{@board[1]} | #{@board[2]} |
       -------------
    B  | #{@board[3]} | #{@board[4]} | #{@board[5]} |
       -------------
    C  | #{@board[6]} | #{@board[7]} | #{@board[8]} |
       -------------\n"
  end

  def check_square(idx)
    if @board[idx] == " "
      true
    else
      false
    end
  end

  def check_winner()
    win = false
    @winning_scenarios.each do |element|
      first = @board[element[0]]
      second = @board[element[1]]
      third = @board[element[2]]
      if (first == second) && (second == third) && (third != ' ')
       win = true
       break
     end
    end
    win
  end
end