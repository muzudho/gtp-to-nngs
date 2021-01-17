
  def newgame(size, komi, time)
    # 何路盤
    send("boardsize #{size}\n")

    # コミ
    send("komi #{komi}\n")

    # 盤初期化
    send("clear_board\n")

    # 時間設定
    send("time_settings #{time} 0 0")
  end
