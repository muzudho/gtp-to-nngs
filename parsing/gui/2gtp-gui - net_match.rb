#! /usr/bin/ruby

require 'socket'
require './Goban'
require './GtpEngine'
require './Match'


def net_match (dpy)
  gs = TCPServer.open(9646)
  socks = [gs]
  addr = gs.addr
  addr.shift
  printf("server is on %s\n", addr.join(":"))
  printf("waiting for clients\n")

  cb = nil
  cw = nil

  t1 = Thread.start(gs.accept) do |s|       # save to dynamic variable
    cb = GtpEngine.new('black', s)
    print cb.send("name\n")
    print cb.send("name\n")
    print cb.send("version\n")
    print(s, " is accepted as BLACK.\n")
  end

  t2 = Thread.start(gs.accept) do |s|       # save to dynamic variable
    cw = GtpEngine.new('white', s)
    print cw.send("name\n")
    print cw.send("name\n")
    print cw.send("name\n")
    print cw.send("version\n")
    print(s, " is accepted as WHITE.\n")
  end

  t1.join
  t2.join
  gs.close()

  m = Match.new(cb, cw)
  m.add_display(dpy)
  m.newgame(5)
end
