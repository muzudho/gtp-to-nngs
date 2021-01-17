
  def send(s)
    return unless @io
    @io.puts(s)
    receive
  end
