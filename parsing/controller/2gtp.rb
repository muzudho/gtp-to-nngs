#! /usr/bin/ruby

# (^q^) GNU Go 同士の対局？

require './ClientUsingGtp'
require './Match'

program =if ARGV.size > 0 
           ARGV.join(' ')
         else
           "/usr/games/bin/gnugo --mode gtp --quiet"
         end

# 対局を付けて、開始します。
m = Match.new(
  ClientUsingGtp.new('black', IO.popen(program, "r+")),
  ClientUsingGtp.new('white', IO.popen(program, "r+"))
)
m.newgame(10)

print "#{program}\n"
