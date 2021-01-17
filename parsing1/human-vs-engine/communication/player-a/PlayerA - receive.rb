
  def receive
    return unless @sock_io
    result = ''
    while (gtp_command = @sock_io.gets) 
      result += gtp_command
      if gtp_command == "\n"
	break
      end
      @playeralistener.each  { | l | l.listen(gtp_command) }
    end
    result
  end
