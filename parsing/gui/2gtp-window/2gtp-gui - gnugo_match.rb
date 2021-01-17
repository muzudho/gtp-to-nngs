#! /usr/bin/ruby

require 'socket'
require './Goban'
require './GtpEngine'
require './Match'

vbox = Gtk::VBox.new()
goban = Goban.new()
vbox.add(goban)


def gnugo_match(dpy)
  program = "/usr/games/bin/gnugo --mode gtp --quiet"
  m = Match.new(
    GtpEngine.new('black', IO.popen(program, "r+")),
    GtpEngine.new('white', IO.popen(program, "r+"))
  )
  m.add_display(dpy)
  m.newgame(5)
end


