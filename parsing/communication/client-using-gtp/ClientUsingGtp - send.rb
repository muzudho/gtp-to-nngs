

  def send(s)
    return unless @io
    @io.puts(s)
    @clientlistenergtp.each  { | l | l.listen(s) }
    receive
  end
