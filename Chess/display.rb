require_relative "board"
require_relative "cursor"
require_relative "piece"
require "colorize"

require "byebug"

class Display

  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render(board, cursor_position)
    system("clear")
    board.chess_board.each_with_index do |row, i|
      r = ""
      x = i
      row.each_with_index do |square, j|
        position = [x, j]
        if i.even? 
          case square 
          when "-"
            position == cursor_position ? r += "   ".red.on_red : r += "   ".yellow.on_yellow 
          when "X"
            position == cursor_position ? r += " #{square} ".blue.on_red : r += " #{square} ".blue.on_yellow
          end 
        else
          case square
          when "-"
            position == cursor_position ? r += "   ".red.on_red : r += "   ".green.on_green
          when "X"
            position == cursor_position ? r += " #{square} ".blue.on_red : r += " #{square} ".blue.on_green
          end
        end
        i += 1
      end 
      puts r 
    end 
  end

  def move
    self.render(self.board, self.cursor.get_input)
  end
end
