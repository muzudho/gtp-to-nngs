

  def waitfor(str)
    reply = ''
    until reply =~ str
      c = @socket.getc
      raise(IOError,"Socket not opened") if c.nil?
      next if c.ord > 127 or c.ord == 1
      reply << c unless c == ?\r
      if c == ?\n
        @banner << reply
        @lastline = reply
        reply = ''
      end
    end
    @lastline=reply
  end
