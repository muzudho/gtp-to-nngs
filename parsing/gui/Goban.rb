#! /usr/bin/env ruby -Ke

require 'gtk'

class Goban < Gtk::DrawingArea
  @@margin = 30



  def pressed(w, ev)
    o = @@margin + @cell_w / 2
    e =  o + (@boardsize - 1) * @cell_w

    i = Integer((ev.x - @@margin) / @cell_w) + 1
    j = @boardsize - Integer((ev.y - @@margin) / @cell_w)
    if (1 <= i && i <= @boardsize && 1 <= j && j <= @boardsize )
      move('w', i, j)
    end
    true
  end
end

#Gtk.init
=begin
goban = Goban.new()

window = Gtk::Window.new()
window.signal_connect('delete_event'){ Gtk::main_quit }
window.add(goban)
window.show_all

Gtk.main
=end
