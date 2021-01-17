
def net_match (dpy)
  # 管理サーバーに接続☆（＾～＾）？
  gs = TCPServer.open(9646)
  socks = [gs]
  addr = gs.addr
  addr.shift
  printf("server is on %s\n", addr.join(":"))
  printf("waiting for clients\n")

  cb = nil
  cw = nil

  # 黒番
  t1 = Thread.start(gs.accept) do |s|       # save to dynamic variable
    cb = ClientUsingGtp.new('black', s)
    print cb.send("name\n")
    print cb.send("name\n")
    print cb.send("version\n")
    print(s, " is accepted as BLACK.\n")
  end

  # 白番
  t2 = Thread.start(gs.accept) do |s|       # save to dynamic variable
    cw = ClientUsingGtp.new('white', s)
    print cw.send("name\n")
    print cw.send("name\n")
    print cw.send("name\n")
    print cw.send("version\n")
    print(s, " is accepted as WHITE.\n")
  end

  t1.join
  t2.join
  gs.close()

  # 対局を付けて、開始する☆（＾～＾）
  m = Match.new(cb, cw)
  m.add_display(dpy)
  m.newgame(5)
end
