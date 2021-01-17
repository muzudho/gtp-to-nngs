#! /usr/bin/env ruby -Ke

require 'gtk'
require './Goban'


goprog = GoProg.new



l = Listener.new(text)
gtp = ComputerPlayer.new
gtp.add_listener(l)





goprog.start(text)

Gtk.main
