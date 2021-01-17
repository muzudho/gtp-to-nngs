#! /usr/bin/env ruby -Ke

require 'gtk'


goban = Goban.new()

goprog = GoProg.new

text = Gtk::Text.new()
text.set_editable(false)

entry = Gtk::Entry.new()
entry.signal_connect('activate') do | entry | 
  p entry.get_text
  text.insert_text(entry.get_text + "\n", text.get_length)
  goprog.send(entry.get_text + "\n")
  entry.set_text('')
end



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
