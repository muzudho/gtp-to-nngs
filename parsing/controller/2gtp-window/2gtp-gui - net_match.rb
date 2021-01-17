
def net_match (dpy)
  # トランスレータ―（このプログラム）が指定ポートを占有して、TCPサーバーとして常駐するぜ☆（＾～＾）
  translator_server_socket = TCPServer.open(9646)
  addr = translator_server_socket.addr
  addr.shift
  printf("server is on %s\n", addr.join(":"))
  printf("waiting for clients\n")

  cb = nil
  cw = nil

  # 黒番
  t1 = Thread.start(translator_server_socket.accept) do |s|       # save to dynamic variable
    cb = Player.new('black', s)
    print cb.send("name\n")
    print cb.send("name\n")
    print cb.send("version\n")
    print(s, " is accepted as BLACK.\n")
  end

  # 白番
  t2 = Thread.start(translator_server_socket.accept) do |s|       # save to dynamic variable
    cw = Player.new('white', s)
    print cw.send("name\n")
    print cw.send("name\n")
    print cw.send("name\n")
    print cw.send("version\n")
    print(s, " is accepted as WHITE.\n")
  end

  t1.join
  t2.join
  translator_server_socket.close()

  # 対局を付けて、開始する☆（＾～＾）
  m = Match.new(cb, cw)
  m.add_translator_display(dpy)
  m.newgame(5)
end
