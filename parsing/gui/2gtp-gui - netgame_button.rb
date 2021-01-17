#! /usr/bin/ruby

require 'socket'
require './Goban'
require './GtpEngine'
require './Match'




netgame = Gtk::Button.new('new game (net)')
netgame.signal_connect('clicked'){
  Thread.new {
    net_match(goban)
  }
}

vbox.add(netgame)
