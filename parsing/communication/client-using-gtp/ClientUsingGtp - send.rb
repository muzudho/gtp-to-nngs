

  def send(s)
    return unless @io
    @io.puts(s)
    @playerlistener.each  { | l | l.listen(s) }
    receive
  end
