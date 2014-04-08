module Mienie
  class MenuPos
    extend Forwardable
    def_delegators :menu, :columns, :rows, :tile_size
    attr_reader :pos, :menu, :width

    def initialize(menu, pos = 0)
      @menu      = menu
      @pos       = pos
    end

    def left_x
      col * tile_size
    end
    alias x1 left_x
    alias x4 left_x

    def right_x
      (col+1) * tile_size
    end
    alias x2 right_x
    alias x3 right_x

    def top_y
      row * tile_size
    end
    alias y1 top_y
    alias y2 top_y

    def bottom_y
      (row+1) * tile_size
    end
    alias y3 bottom_y
    alias y4 bottom_y

    def col
      pos % columns
    end

    def row
      pos / columns
    end
  end
end
