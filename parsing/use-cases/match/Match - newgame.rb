
  # 対局を開始するよう、プレイヤーに通知します。
  def newgame(size = 5, komi = 0.0)
    # 対局を開始するよう、プレイヤーに通知します。
    @clients.each { | c |
      c.newgame(size, komi)
    }
    # 対局を開始するよう、トランスレータ―の画面に通知します。
    @translator_display.each { | dpy |
      dpy.newgame(size, komi)
    }
    # 指し手の配列を空っぽにします。
    @moves = []

    # 2者連続パスで対局終了
    pass = 0

    # 盤の空点の数を、ざっくり最大手数にします。
    # TODO 最大手数
    (0..(size * size)).each { |i|

      phase = i % 2
      opponent_phase = (i + 1) % 2
      p [i, phase, opponent_phase]
      
      # print @clients[phase].send("showboard\n")

      # 指し手を返してください。
      mv = @clients[phase].genmove
      p mv

      # パス
      if mv[0].nil?
      	pass+=1
      end

      # この手を指しました。
      @clients[opponent_phase].playmove(mv)
      @translator_display.each { | dpy |
      	dpy.move(mv)
      }

      @moves << mv
      break if pass >= 2
    }

    p @moves

    # 両者を終了させます。
    @clients.each { | c |
      c.quit
    }
  end