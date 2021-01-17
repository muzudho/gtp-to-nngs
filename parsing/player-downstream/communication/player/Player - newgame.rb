
  def newgame(color, size = 19, komi = 6.5)


    @color = color
    @boardsize = size
    @komi = komi

    send("boardsize #{@boardsize}\n")
    send("komi #{@komi}\n")
    send("clear_board\n")

    true
  end
