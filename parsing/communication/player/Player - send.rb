

  def send(gtp_command)
    return unless @io
    @io.puts(gtp_command)
    @playerlistener.each  { | l | l.listen(gtp_command) }
    receive
  end
