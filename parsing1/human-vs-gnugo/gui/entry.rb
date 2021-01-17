#! /usr/bin/env ruby -Ke


require 'gtk'


goban = Goban.new()

goprog = GoProg.new


goprog.start(textarea)

Gtk.main
