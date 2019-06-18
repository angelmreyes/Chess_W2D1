require_relative "piece"
require_relative "display"
require "colorize"

class Board
  attr_reader :chess_board

  def initialize
    @chess_board = Array.new(8) { Array.new(8) }
    @chess_board.map!.with_index do |rank, i|
      if i == 0 || i == 1 || i == 6 || i == 7
       rank.map {|sq| Piece.new.piece } 
      else 
       rank.map {|sq| Piece.new.empty_piece} 
      end 
    end
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos] == Piece.new.empty_piece 
      raise "There is no piece in the square"
    elsif self[end_pos] != Piece.new.empty_piece  
      raise "Square is already taken"
    end 
    self[end_pos], self[start_pos] = self[start_pos], self[end_pos] 
  end 

  def [](position)
    x, y = position
    @chess_board[x][y]
  end
  
  def []=(position, value)
    x, y = position
    @chess_board[x][y] = value
  end

  def valid_pos?(position)
    x, y = position
    (0..7).any? { |n| n == x } && (0..7).any? { |n| n == y }
  end
end



if $PROGRAM_NAME == __FILE__
  chess = Board.new
  display = Display.new(chess)
  while true
    display.move
    puts 
    puts
  end
  puts 
  puts
  # chess.move_piece([0,0], [3,0])
end