#! /usr/bin/env ruby -Ke

require 'gtk'
require './Goban'


goprog = GoProg.new



l = ClientListenerUsingGtp.new(text)
gtp = Player.new
gtp.add_playerlistener(l)





goprog.start(text)

Gtk.main
