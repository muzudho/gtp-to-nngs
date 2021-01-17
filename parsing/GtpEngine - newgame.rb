
  def newgame(size, komi, time) 
    send("boardsize #{size}\n")
    send("komi #{komi}\n")
    send("clear_board\n")
    send("time_settings #{time} 0 0")
  end
