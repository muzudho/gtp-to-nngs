#! /usr/bin/ruby

# (^q^) Rename '2gtp' to 'player-upstream'.

require 'socket'
require './Goban'





Gtk.timeout_add(10) {
  while (Gtk.events_pending)
    Gtk.main_iteration
  end
}

Gtk.main
