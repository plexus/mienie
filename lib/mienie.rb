require 'pathname'
require 'forwardable'
require 'yaml'

require 'gosu'
require 'bloops'

module Mienie
  ROOT = Pathname(__FILE__).dirname.parent
end

require 'mienie/live_bloops'
require 'mienie/bloopsiano'
require 'mienie/menu'
require 'mienie/menu_pos'
require 'mienie/menu_selection'
require 'mienie/menu_image'
require 'mienie/menu_entry'
require 'mienie/main_window'

module Mienie
  class << self
    def main_loop
      loop do
        @window = Mienie::MainWindow.new
        @window.show
        @window = nil
        command, @command = @command, nil
        system(command) if command
      end
    end

    def shellout(command)
      @command = command
      @window.close if @window
    end
  end
end
