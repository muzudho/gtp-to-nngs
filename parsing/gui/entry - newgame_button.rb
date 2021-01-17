#! /usr/bin/env ruby -Ke

require 'gtk'




newgame = Gtk::Button.new('newgame')
newgame.signal_connect('clicked'){
  goprog.send("boardsize 5\n")
  goprog.send("komi 0\n")
  goprog.send("clear_board\n")
}
