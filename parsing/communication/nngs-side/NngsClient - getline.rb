
  def getline
    line = @socket.gets("\r\n").chop
    puts  "NNGS -> #{line}"
    line
  end
