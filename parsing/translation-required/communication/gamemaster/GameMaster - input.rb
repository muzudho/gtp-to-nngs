

  def input(cmd)
    puts "NNGS <- #{cmd}"
    @socket.puts cmd
  end
