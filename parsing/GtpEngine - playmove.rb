

  def playmove (mv)
    move = encode_coords(mv[0])
    color = mv[1]
    
    send("play #{color} #{move}\n")
  end
