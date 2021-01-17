

  def send(gtp_command)
    return unless @sock_io
    @sock_io.puts(gtp_command)
    @playerlistener.each  { | l | l.listen(gtp_command) }
    receive
  end
