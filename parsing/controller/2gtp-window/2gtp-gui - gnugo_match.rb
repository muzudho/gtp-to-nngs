# (^q^) GNU Go 同士を対局させる？

def gnugo_match(dpy)
  program = "/usr/games/bin/gnugo --mode gtp --quiet"
  m = Match.new(
    ClientUsingGtp.new('black', IO.popen(program, "r+")),
    ClientUsingGtp.new('white', IO.popen(program, "r+"))
  )
  m.add_display(dpy)
  m.newgame(5)
end


