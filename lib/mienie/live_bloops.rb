module Mienie
  class LiveBloop
    def initialize
      @notes = {}
      (2..5).each do |oct|
        ('a'..'g').each do |note|
          ['', '#'].each do |sharp|
            name = [note,sharp,oct].join
            bloops = Bloops.new
            sound  = bloops.load Mienie::ROOT.join('sounds/ice.blu').to_s
            bloops.tune sound, name
            @notes[name] = bloops
          end
        end
      end
    end

    def play(note)
      @notes[note].play
    end
  end
end
