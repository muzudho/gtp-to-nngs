#! /usr/bin/ruby

# (^q^) サーバーから クライアント・ソフトに 単発メッセージ（プログラム）を送るのに使う？？

require "socket"

if ARGV.size < 2
  print "\nusage: ruby 2gtpclt <hostname> <program> <program option>\n\n"
  exit
else
  host, *prog_v = ARGV
  program = prog_v.join(' ')
  print "host: #{host}\n"
  print "program: #{program}\n"
end

# 管理者ログイン？
# ポートを開きます。
srv = TCPSocket.open(host, 9646)

# コンピューター囲碁ソフト クライアント？
gtp = IO.popen(program, "r+")
#srv.write("init\n")

# メインループ
while cmd = srv.gets
  p ["cmd", cmd]
  gtp.puts "#{cmd}\n"
  gtp.flush

  # 受信待機
  rcv = ""
  while (s = gtp.gets) 
    rcv += s
    if s == "\n"
      break
    end
  end
  p ["rcv", rcv]
  srv.write rcv
end

srv.close
gtp.close
