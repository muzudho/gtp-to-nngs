
  def receive
    return unless @io
    while (s = @io.gets) 
      if s == "\n"
	break
      end
      @text.insert_text(s, @text.get_length)
    end
#    s = @io.read
#    @text.insert_text(s + "\n", @text.get_length)
  end
