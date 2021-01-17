
  def send(s)
    return unless @sock_io
    @sock_io.puts(s)
    receive
  end
