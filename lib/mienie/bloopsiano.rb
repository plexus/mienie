module Mienie
  class Bloopsiano
    extend Forwardable

    QWERTY = {
      Gosu::KbA => 'c3',
      Gosu::KbW => 'c#3',
      Gosu::KbS => 'd3',
      Gosu::KbE => 'd#3',
      Gosu::KbD => 'e3',
      Gosu::KbF => 'f3',
      Gosu::KbT => 'f#3',
      Gosu::KbG => 'g3',
      Gosu::KbY => 'g#3',
      Gosu::KbH => 'a3',
      Gosu::KbU => 'a#3',
      Gosu::KbJ => 'b3',
      Gosu::KbK => 'c4',
      Gosu::KbO => 'c#4',
      Gosu::KbL => 'd4',
    }.freeze

    attr_reader :keymap, :live_bloop

    def_delegators :live_bloop, :play

    def initialize(keymap)
      @keymap = self.class.const_get(keymap.to_s.upcase) if keymap.is_a? Symbol
      @live_bloop   = LiveBloop.new
      @buttons_down = {}
    end

    def button_down(id)
      @live_bloop.play(keymap[id]) if keymap.key?(id)
    end
  end
end
