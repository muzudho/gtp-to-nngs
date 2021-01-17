


quit = Gtk::Button.new('quit')
quit.signal_connect('clicked'){
  Gtk::main_quit
}
