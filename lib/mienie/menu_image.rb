module Mienie
  class MenuImage
    extend Forwardable
    attr_reader :image, :menu_pos

    def_delegator :menu_pos, :x1, :x
    def_delegator :menu_pos, :y1, :y

    def initialize(image, menu_pos)
      @image, @menu_pos = image, menu_pos
    end

    def draw
      z = -1
      image.draw(x, y, z, factor_x, factor_y)
    end

    def factor_x
      menu_pos.tile_size.to_f / image.width
    end

    def factor_y
      menu_pos.tile_size.to_f / image.height
    end

  end
end
