
  # 指し手の指定
  def playmove (move_and_color)
    # 座標またはパス
    move = encode_coords(move_and_color[0])
    # 色
    color = move_and_color[1]
    
    send("play #{color} #{move}\n")
  end
