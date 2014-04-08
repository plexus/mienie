module Mienie
  class MenuSelection < MenuPos
    attr_reader :width

    def initialize(menu, pos = 0)
      super
      @width     = 5
    end

    def opacity
      (((Time.now.to_f % 3) / 3 - 0.5).abs * 155).to_i + 100
    end

    def color
      Gosu::Color.argb((opacity.to_s(16) + 'EDA223').hex)
    end

    def new(col, row)
      self.class.new(
        menu,
        (row % rows) * columns + (col % columns)
      )
    end

    def draw(window)
      window.draw_quad(x1, y1, color, x2, y2, color, x1, y1+width, color, x2, y2+width, color, 0)
      window.draw_quad(x2, y2+width, color, x3, y3-width, color, x2-width, y2+width, color, x3-width, y3-width, color, 0)
      window.draw_quad(x3, y3, color, x4, y4, color, x3, y3-width, color, x4, y4-width, color, 0)
      window.draw_quad(x4, y4-width, color, x1, y1+width, color, x4+width, y4-width, color, x1+width, y1+width, color, 0)
    end

    def button_down(id)
      yield if block_given? && [Gosu::KbLeft,Gosu::KbRight,Gosu::KbUp,Gosu::KbDown].include?(id)
      case id
      when Gosu::KbLeft
        go_left
      when Gosu::KbRight
        go_right
      when Gosu::KbUp
        go_up
      when Gosu::KbDown
        go_down
      else
        self
      end
    end

    def go_right
      new(col + 1, row)
    end

    def go_left
      new(col - 1, row)
    end

    def go_up
      new(col, row - 1)
    end

    def go_down
      new(col, row + 1)
    end
  end
end
