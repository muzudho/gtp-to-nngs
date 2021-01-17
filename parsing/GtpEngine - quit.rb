
  def quit
    send("quit\n")
    @io.close
  end