#! /usr/bin/env ruby -Ke

require 'gtk'

class Goban < Gtk::DrawingArea
  @@margin = 30



end

#Gtk.init
=begin
goban = Goban.new()

window = Gtk::Window.new()
window.signal_connect('delete_event'){ Gtk::main_quit }
window.add(goban)
window.show_all

Gtk.main
=end
