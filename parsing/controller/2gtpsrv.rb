#! /usr/bin/ruby

# (^q^) マッチングして対局を開始するのに使う？

require "socket"
require './ClientUsingGtp'
require './Match'

# メインループ
while true
  # 管理者向けサーバー？
  gs = TCPServer.open(9646)
  socks = [gs]
  addr = gs.addr
  addr.shift
  printf("server is on %s\n", addr.join(":"))
  
  cb = nil
  cw = nil

  # 黒石側のスレッド
  t1 = Thread.start(gs.accept) do |s|       # save to dynamic variable
    cb = ClientUsingGtp.new('black', s)
    print(s, " is accepted as BLACK.\n")
  end

  # 白石側のスレッド
  t2 = Thread.start(gs.accept) do |s|       # save to dynamic variable
    cw = ClientUsingGtp.new('white', s)
    print(s, " is accepted as WHITE.\n")
  end
  t1.join
  t2.join
  gs.close()

  # 対局を付けて、ゲーム開始
  m = Match.new(cb, cw)
  m.newgame

  print "next game?(y/N) "
  yn = gets
  if ! yn[/[yY]/]
    exit
  end
end
      
