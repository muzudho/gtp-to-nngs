
  def newgame(size = 5, komi = 0.0)
    @clients.each { | c |
      c.newgame(size, komi)
    }
    @dpy_a.each { | dpy |
      dpy.newgame(size, komi)
    }
    @move_a = []

    # 2者連続パスで対局終了
    pass = 0

    (0..(size * size)).each { |i|

      bw = i % 2
      wb = (i + 1) % 2
      p [i, bw, wb]
      
      # print @clients[bw].send("showboard\n")
      mv = @clients[bw].genmove
      p mv

      # パス
      if mv[0].nil?
      	pass+=1
      end

      @clients[wb].playmove(mv)
      @dpy_a.each { | dpy |
      	dpy.move(mv)
      }

      @move_a << mv
      break if pass >= 2
    }

    p @move_a

    # 両者を終了させます。
    @clients.each { | c |
      c.quit
    }
  end