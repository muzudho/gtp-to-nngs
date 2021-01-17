#! /usr/bin/ruby

require 'socket'
require './Goban'
require './GtpEngine'
require './Match'

vbox = Gtk::VBox.new()
goban = Goban.new()
vbox.add(goban)






window = Gtk::Window.new()
window.signal_connect('delete_event'){ Gtk::main_quit }
window.add(vbox)
window.show_all

Gtk.timeout_add(10) {
  while (Gtk.events_pending)
    Gtk.main_iteration
  end
}

Gtk.main
