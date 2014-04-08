module Mienie
  class MenuEntry
    extend Forwardable
    def_delegators :menu_image, :draw
    attr_reader :menu_image, :data

    def initialize(menu_image, data)
      @menu_image = menu_image
      @data = data
    end

    def execute
      if data['command']
        Mienie.shellout(data['command'])
      end
    end
  end
end
