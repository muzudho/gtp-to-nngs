#! /usr/bin/env ruby -Ke

require 'gtk'
require './Goban'


goban = Goban.new()

goprog = GoProg.new

text = Gtk::Text.new()
text.set_editable(false)


l = Listener.new(text)
gtp = GtpEngine.new
gtp.add_listener(l)

entry = Gtk::Entry.new()
entry.signal_connect('activate') do | entry | 
  p entry.get_text
  text.insert_text(entry.get_text + "\n", text.get_length)
  goprog.send(entry.get_text + "\n")
  entry.set_text('')
end


newgame = Gtk::Button.new('newgame')
newgame.signal_connect('clicked'){
  goban.set_boardsize(5)
  goprog.send("boardsize 5\n")
  goprog.send("komi 0\n")
  goprog.send("clear_board\n")
}

quit = Gtk::Button.new('quit')
quit.signal_connect('clicked'){
  goprog.send("quit\n")
  Gtk::main_quit
}

vbox = Gtk::VBox.new();
vbox.add(goban)
vbox.add(entry)
vbox.add(text)
vbox.add(newgame)
vbox.add(quit)

window = Gtk::Window.new()
window.signal_connect('delete_event'){ Gtk::main_quit }
window.add(vbox)
window.show_all


goprog.start(text)

Gtk.main
