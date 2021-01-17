
  def receive
    return unless @sock_io
    while (s = @sock_io.gets) 
      if s == "\n"
	break
      end
      @textarea.insert_text(s, @textarea.get_length)
    end
#    s = @sock_io.read
#    @textarea.insert_text(s + "\n", @textarea.get_length)
  end
