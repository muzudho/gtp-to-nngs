#! /usr/bin/ruby

require 'socket'
require './Goban'
require './GtpEngine'
require './Match'




newgame = Gtk::Button.new('new game')
newgame.signal_connect('clicked'){
  Thread.new {
    gnugo_match(goban)
  }
}

vbox.add(newgame)
