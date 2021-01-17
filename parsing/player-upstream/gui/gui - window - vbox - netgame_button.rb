
netgame = Gtk::Button.new('new game (net)')
netgame.signal_connect('clicked'){
  Thread.new {
    net_match(goban)
  }
}
