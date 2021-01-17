
def net_match (dpy)
  # トランスレータ―（このプログラム）が指定ポートを占有して、TCPサーバーとして常駐するぜ☆（＾～＾）
  translator_server_socket = TCPServer.open(9646)
  addr = translator_server_socket.addr
  addr.shift
  printf("server is on %s\n", addr.join(":"))
  printf("waiting for clients\n")

  black_client = nil
  white_client = nil

  # 黒番
  t1 = Thread.start(translator_server_socket.accept) do |text|       # save to dynamic variable
    black_client = PlayerB.new('black', text)
    print black_client.send("name\n")
    print black_client.send("name\n")
    print black_client.send("version\n")
    print(text, " is accepted as BLACK.\n")
  end

  # 白番
  t2 = Thread.start(translator_server_socket.accept) do |text|       # save to dynamic variable
    white_client = PlayerB.new('white', text)
    print white_client.send("name\n")
    print white_client.send("name\n")
    print white_client.send("name\n")
    print white_client.send("version\n")
    print(text, " is accepted as WHITE.\n")
  end

  t1.join
  t2.join
  translator_server_socket.close()

  # 対局を付けて、開始する☆（＾～＾）
  m = Match.new(black_client, white_client)
  m.add_translator_display(dpy)
  m.newgame(5)
end
