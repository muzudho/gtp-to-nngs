

  def logout
    @socket.puts('quit')
    @socket.close
    self.logouted
  end
