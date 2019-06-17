require_relative "piece"

class Board
  attr_reader :chess_board

  def initialize
    @chess_board = Array.new(8) { Array.new(8) }
    @chess_board.map!.with_index do |rank, i|
      if i == 0 || i == 1 || i == 6 || i == 7
       rank.map {|sq| Piece.new.piece} 
      else 
       rank.map {|sq| nil} 
      end 
    end
  end

  def move_piece(start_pos, end_pos)
    x, y = start_pos
    r, c = end_pos
    if @chess_board[x][y] == nil 
      raise "There is no piece in the square"
    elsif @chess_board[r][c] != nil  
      raise "Square is already taken"
    end 
    
    @chess_board[r][c], @chess_board[x][y] = @chess_board[x][y], @chess_board[r][c]
  end 




end



if $PROGRAM_NAME == __FILE__
    chess = Board.new
    chess.chess_board.each do |row|
        p row
    end
    puts 
    puts
    chess.move_piece([0,0], [3,0])
    chess.chess_board.each do |row|
        p row
    end 
  
end