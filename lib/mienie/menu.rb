module Mienie
  class Menu
    attr_reader :columns, :rows, :bsize

    def initialize
      @columns = 5
      @rows = 3
      @bsize = 256
    end
  end
end
