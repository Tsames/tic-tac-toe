require_relative "players.rb"
require_relative "board.rb"

class Game
  def initialize()
    @choice = 0

    @our_board = Board.new
    puts "Welcome to a new game of Tic Tac Toe!"
    puts "Please enter the name of player one:"
    @player_one = Players.new(gets.chomp)
    puts "Now, please enter the name of player two:"
    @player_two = Players.new(gets.chomp )
    puts ("\nPlayer One, #{@player_one.name}, has the #{@player_one.piece} piece.")
    puts ("Player Two, #{@player_two.name}, has the #{@player_two.piece} piece.")

    run_game()
  end

  def get_choice
    gets.chomp.upcase
  end

  def switch_active_player(active_player)
    if  active_player == @player_one
      @player_two
    else
      @player_one
    end
  end

  def sort_choice(player_answer)
    case player_answer
    when 'A1'
      @choice = 0
      true
    when 'A2'
      @choice = 1
      true
    when 'A3'
      @choice = 2
      true
    when 'B1'
      @choice = 3
      true
    when 'B2'
      @choice = 4
      true
    when 'B3'
      @choice = 5
      true
    when 'C1'
      @choice = 6
      true
    when 'C2'
      @choice = 7
      true
    when 'C3'
      @choice = 8
      true
    else
      false
    end
  end

  def take_turn(choosing_player)
    check_input = false
    puts "\n#{choosing_player.name}, please enter your square of choice for this turn."
    while check_input == false do
      check_input = sort_choice(get_choice)
      #First Check - Proper Coordinate Entered
      if check_input == false
        puts "Please enter a valid coordinate as your choice."
      else
        #Second Check - Available Square Selected
        check_input = @our_board.check_square(@choice)
        unless check_input == true
          puts "That space is already taken, please enter a valid coordinate."
        end
      end
    end
    #Set Square & Print Board
    @our_board.board[@choice] = choosing_player.piece
    @our_board.print_board
  end

  def run_game()
    active_player = @player_one
    check_win = false
    @our_board.print_board
    for i in 0...9
      take_turn(active_player)
      check_win = @our_board.check_winner()
      if check_win == true
        puts "Ding Ding Ding, we have a winner! #{active_player.name} is the winner!"
        break
      end
      active_player = switch_active_player(active_player)
    end
    if check_win == false
      puts "\nIt's a tie!"
    end
  end
end

#Run Game

new_game = Game.new