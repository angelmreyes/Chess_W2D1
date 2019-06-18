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
    board.chess_board.each_with_index do |row, i|
      r = ""
      row.each_with_index do |square, j|
        #p "square = #{[i, j]}"
        position = [i, j]
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
    #debugger
    self.render(self.board, self.cursor.get_input)
  end
   

  #board[cursor.cursor_pos] render in different color
  #p "[i, j]= #{[i, j]} cursor= #{cursor_position}"
    # when  bool #&& "-"
    #     r += "   ".red.on_red 
    # when bool #&& "X"
    #     r += " #{square} ".blue.on_red
    # when  bool #&& "-"
    #     r += "   ".red.on_red 
    # when bool #&& "X"
    #     r += " #{square} ".blue.on_red
    # end  
end
