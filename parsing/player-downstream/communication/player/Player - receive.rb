
  def receive
    return unless @io
    result = ''
    while (s = @io.gets) 
      result += s
      if s == "\n"
	break
      end
      @playerlistener.each  { | l | l.listen(s) }
    end
    result
  end
