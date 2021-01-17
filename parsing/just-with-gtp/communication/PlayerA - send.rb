
  def send(gtp_command)
    return unless @sock_io
    @sock_io.puts(gtp_command)

    @playeralistener.each  { | l | l.listen(gtp_command) }
    
    receive
  end
