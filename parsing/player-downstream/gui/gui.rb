#! /usr/bin/env ruby -Ke

# (^q^) Rename 'vsGTP' to 'player downstream'.

require 'gtk'
require './Goban'


goprog = GoProg.new



l = ClientListenerUsingGtp.new(textarea)
player = Player.new
player.add_playerlistener(l)





goprog.start(textarea)

Gtk.main
