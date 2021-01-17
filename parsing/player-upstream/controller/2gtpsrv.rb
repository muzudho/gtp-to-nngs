#! /usr/bin/ruby

# (^q^) '2gtpsrv' は、マッチングして対局を開始するのに使う？

require "socket"

# メインループ
while true
  # トランスレータ―（このプログラム）が指定ポートを占有して、TCPサーバーとして常駐するぜ☆（＾～＾）
  translator_server_socket = TCPServer.open(9646)
  addr = translator_server_socket.addr
  addr.shift
  printf("server is on %s\n", addr.join(":"))
  
  black_client = nil
  white_client = nil

  # 黒石側のスレッド
  t1 = Thread.start(translator_server_socket.accept) do |text|       # save to dynamic variable
    black_client = PlayerUpstream.new('black', text)
    print(text, " is accepted as BLACK.\n")
  end

  # 白石側のスレッド
  t2 = Thread.start(translator_server_socket.accept) do |text|       # save to dynamic variable
    white_client = PlayerUpstream.new('white', text)
    print(text, " is accepted as WHITE.\n")
  end
  t1.join
  t2.join
  translator_server_socket.close()

  # 対局を付けて、ゲーム開始
  m = Match.new(black_client, white_client)
  m.newgame

  print "next game?(y/N) "
  yn = gets
  if ! yn[/[yY]/]
    exit
  end
end
      
