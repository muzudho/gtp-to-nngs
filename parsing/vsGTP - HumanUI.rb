#! /usr/bin/env ruby -Ke

require 'gtk'
require './Goban'



class HumanUI < GoEngine
  def initialize(goban)
    @goban = goban
  end
  def newgame(color, size, komi = 0.0)
    @goban.set_boardsize(size)
  end

  def genmove
    
  end

  def play
  end

  def score
  end
end

