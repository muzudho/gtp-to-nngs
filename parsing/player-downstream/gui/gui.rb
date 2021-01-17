#! /usr/bin/env ruby -Ke

# (^q^) Rename 'vsGTP' to 'player downstream'.

require 'gtk'
require './Goban'


goprog = GoProg.new



l = ClientListenerUsingGtp.new(text)
player = Player.new
player.add_playerlistener(l)





goprog.start(text)

Gtk.main
