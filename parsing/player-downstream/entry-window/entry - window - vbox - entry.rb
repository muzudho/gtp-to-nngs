
# (^q^) GTK entry は、一行のテキストボックスのことだぜ☆

entry = Gtk::Entry.new()
entry.signal_connect('activate') do | entry | 
  p entry.get_text
  textarea.insert_text(entry.get_text + "\n", textarea.get_length)
  goprog.send(entry.get_text + "\n")
  entry.set_text('')
end

