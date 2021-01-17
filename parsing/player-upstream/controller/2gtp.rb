#! /usr/bin/ruby

# (^q^) '2gtp' は、 GNU Go 同士の対局？

require './GtpClient'

# (^q^) コマンドライン
commandline =if 0 < ARGV.size
           ARGV.join(' ')
         else
           "/usr/games/bin/gnugo --mode gtp --quiet"
         end

# 対局を付けて、開始します。
m = Match.new(
  GtpClient.new('black', IO.popen(commandline, "r+")),
  GtpClient.new('white', IO.popen(commandline, "r+"))
)
m.newgame(10)

print "#{commandline}\n"
