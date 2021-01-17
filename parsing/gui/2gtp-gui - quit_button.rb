#! /usr/bin/ruby

require 'socket'
require './Goban'
require './GtpEngine'
require './Match'





quit = Gtk::Button.new('quit')
quit.signal_connect('clicked'){
  Gtk::main_quit
}
vbox.add(quit)
