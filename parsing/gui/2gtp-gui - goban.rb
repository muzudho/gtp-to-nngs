#! /usr/bin/ruby

require 'socket'
require './Goban'
require './GtpEngine'
require './Match'


class << goban
  def newgame(size, komi)
    set_boardsize(size)
  end
  def move(mv)
    p mv
    coords = mv[0]
    color = mv[1]
    if ! coords.nil?
      p coords
      draw_move(color, coords[0], coords[1])
    end
  end
end

