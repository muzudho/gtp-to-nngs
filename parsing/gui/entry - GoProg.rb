#! /usr/bin/env ruby -Ke

require 'gtk'

class GoProg
  @io
  @text
  def start(text)
#      prog="/home/kubo/tmp/nngs/clients/gtp_skel/sample"
    prog="/usr/games/bin/gnugo --mode gtp --quiet"
    @io = IO.popen(prog, "r+")
    @text = text
  end

  def send(s)
    return unless @io
    @io.puts(s)
    receive
  end

  def receive
    return unless @io
    while (s = @io.gets) 
      if s == "\n"
	break
      end
      @text.insert_text(s, @text.get_length)
    end
#    s = @io.read
#    @text.insert_text(s + "\n", @text.get_length)
  end
end
