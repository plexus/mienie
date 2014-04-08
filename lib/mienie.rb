require 'pathname'
require 'forwardable'

require 'gosu'
require 'bloops'

module Mienie
  ROOT = Pathname(__FILE__).dirname.parent
end

require 'mienie/live_bloops'
require 'mienie/bloopsiano'
require 'mienie/menu'
require 'mienie/menu_selection'

module Mienie

  class MainWindow < Gosu::Window
    def initialize
      super 1280, 768, false
      self.caption = "Gosu Tutorial Game"
      @piano = Bloopsiano.new(:qwerty)
      @menu_selection = MenuSelection.new(Menu.new, 0)
      @image = Gosu::Image.new(self, '/home/arne/Documents/scooter_kinmen.jpg')
    end

    def update
    end

    def draw
      @menu_selection.draw(self)
      @image.draw(0,0,-1)
    end

    def button_down(id)
      @piano.button_down(id)
      @menu_selection = @menu_selection.button_down(id) do
        @piano.play 'g3'
      end
      self.close if id == Gosu::KbSpace
      exit if id == Gosu::KbEscape
    end

  end
end
