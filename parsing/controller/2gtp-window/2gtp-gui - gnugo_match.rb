# (^q^) GNU Go 同士を対局させる？

def gnugo_match(dpy)
  program = "/usr/games/bin/gnugo --mode gtp --quiet"
  m = Match.new(
    Player.new('black', IO.popen(program, "r+")),
    Player.new('white', IO.popen(program, "r+"))
  )
  m.add_display(dpy)
  m.newgame(5)
end


