

quit = Gtk::Button.new('quit')
quit.signal_connect('clicked'){
  goprog.send("quit\n")
  Gtk::main_quit
}
