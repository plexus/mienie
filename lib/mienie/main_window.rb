module Mienie
  class MainWindow < Gosu::Window
    def initialize
      super 1280, 768, false
      self.caption = "Gosu Tutorial Game"
      @piano = Bloopsiano.new(:qwerty)
      @menu = Menu.new(self)
    end

    def update
    end

    def draw
      @menu.draw(self)
      #@image.draw(0,0,-1)
    end

    def button_down(id)
      @piano.button_down(id)
      @menu = @menu.button_down(id) do
        @piano.play 'g3'
      end
      self.close if id == Gosu::KbSpace
      exit if id == Gosu::KbEscape
    end
  end
end
