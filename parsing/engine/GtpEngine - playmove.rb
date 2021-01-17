
  # 指し手の指定
  def playmove (mv)
    # 座標またはパス
    move = encode_coords(mv[0])
    # 色
    color = mv[1]
    
    send("play #{color} #{move}\n")
  end
