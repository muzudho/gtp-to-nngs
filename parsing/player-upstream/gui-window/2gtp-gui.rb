#! /usr/bin/ruby

require 'socket'
require './Goban'





Gtk.timeout_add(10) {
  while (Gtk.events_pending)
    Gtk.main_iteration
  end
}

Gtk.main
