

  def receive
    return unless @io
    rcv = ''
    while (s = @io.gets) 
      puts " GTP -> #{s}"
      rcv += s
      if s == "\n"
	break
      end
    end
    rcv
  end
