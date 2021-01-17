
  def receive
    return unless @io
    while (s = @io.gets) 
      if s == "\n"
	break
      end
      @textarea.insert_text(s, @textarea.get_length)
    end
#    s = @io.read
#    @textarea.insert_text(s + "\n", @textarea.get_length)
  end
