#! /usr/bin/env ruby -Ke

require 'gtk'
require './Goban'


goprog = GoProg.new



l = ClientListenerUsingGtp.new(text)
gtp = ClientUsingGtp.new
gtp.add_clientlistenergtp(l)





goprog.start(text)

Gtk.main
