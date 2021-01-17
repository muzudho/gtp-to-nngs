
  # NNGSから通知された残り時間をプレイヤーに知らせる？
  def time_left (color, left)
    send("time_left #{color} #{left} 0\n")
  end
