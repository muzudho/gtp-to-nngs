


newgame = Gtk::Button.new('new game')
newgame.signal_connect('clicked'){
  Thread.new {
    gnugo_match(goban)
  }
}
