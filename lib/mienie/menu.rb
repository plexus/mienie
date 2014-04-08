module Mienie
  class Menu
    attr_reader :window, :columns, :rows, :tile_size, :selection, :entries

    def initialize(window, columns = 5, rows = 3, tile_size = 256, selection = nil, entries = nil)
      @columns   = columns
      @rows      = rows
      @tile_size = tile_size
      @selection = selection || MenuSelection.new(self)
      @window    = window
      @entries   = entries || load_entries
    end

    def load_entries
      YAML.load(Mienie::ROOT.join('menu.yml').read).map.with_index do |data, index|
        MenuEntry.new(
          MenuImage.new(
            Gosu::Image.new(window, Mienie::ROOT.join('images', data['image']).to_s),
            MenuPos.new(self, index)
          ),
          data
        )
      end
    end

    def draw(window)
      selection.draw(window)
      entries.map &:draw
    end

    def button_down(id, &blk)
      entries[selection.pos].execute if id == Gosu::KbReturn
      new_selection = selection.button_down(id, &blk)
      if new_selection != selection
        self.class.new(window, columns, rows, tile_size, new_selection, entries)
      else
        self
      end
    end
  end
end
