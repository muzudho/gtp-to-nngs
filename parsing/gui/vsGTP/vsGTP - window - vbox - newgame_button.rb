# (^q^) 5路盤？

newgame = Gtk::Button.new('newgame')
newgame.signal_connect('clicked'){
  goban.set_boardsize(5)
  goprog.send("boardsize 5\n")
  goprog.send("komi 0\n")
  goprog.send("clear_board\n")
}
