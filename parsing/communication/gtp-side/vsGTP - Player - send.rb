

  def send(s)
    return unless @io
    @io.puts(s)
    @listener.each  { | l | l.listen(s) }
    receive
  end
