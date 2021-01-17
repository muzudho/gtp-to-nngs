
window = Gtk::Window.new()
window.signal_connect('delete_event'){
  Gtk::main_quit
}

window.add(drawing_area)


window.show_all
