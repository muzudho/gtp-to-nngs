
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
  t1 = Thread.start(translator_server_socket.accept) do |sock_io|       # save to dynamic variable
    black_client = GtpEngine.new('black', sock_io)
    print black_client.send("name\n")
    print black_client.send("name\n")
    print black_client.send("version\n")
    print(sock_io, " is accepted as BLACK.\n")
  end

  # 白番
  t2 = Thread.start(translator_server_socket.accept) do |sock_io|       # save to dynamic variable
    white_client = GtpEngine.new('white', sock_io)
    print white_client.send("name\n")
    print white_client.send("name\n")
    print white_client.send("name\n")
    print white_client.send("version\n")
    print(sock_io, " is accepted as WHITE.\n")
  end

  t1.join
  t2.join
  translator_server_socket.close()

  # 対局を付けて、開始する☆（＾～＾）
  m = Match.new(black_client, white_client)
  m.add_translator_display(dpy)
  m.newgame(5)
end
