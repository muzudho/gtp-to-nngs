#! /usr/bin/env ruby -Ke

require 'gtk'
require './Goban'



class Listener
  def initialize(text)
    @text=text
  end

  def listen(s)
    @text.insert_text(s, @text.get_length)
  end
end
