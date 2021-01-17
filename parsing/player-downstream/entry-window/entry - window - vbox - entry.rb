
# (^q^) GTK entry は、一行のテキストボックスのことだぜ☆

entry = Gtk::Entry.new()
entry.signal_connect('activate') do | entry | 
  p entry.get_text
  text.insert_text(entry.get_text + "\n", text.get_length)
  goprog.send(entry.get_text + "\n")
  entry.set_text('')
end

