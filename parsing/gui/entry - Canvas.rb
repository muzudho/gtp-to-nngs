#! /usr/bin/env ruby -Ke

require 'gtk'


class Canvas < Gtk::DrawingArea
  def initialize
    super
    signal_connect("expose_event") { |w,e| expose_event(w,e) }
    signal_connect("configure_event") { |w, e| configure_event(w,e) }
    @buffer = nil
    @bgc = nil
  end

  def expose_event(w,e)
    if ! @buffer.nil?
      rec = e.area
      w.window.draw_pixmap(@bgc, @buffer, rec.x, rec.y,
                           rec.x, rec.y, rec.width, rec.height)
    end
    false
  end

  def clear(b = @buffer)
    return if b.nil?

    g = b.get_geometry
    @bgc = self.style.bg_gc(self.state) if @bgc.nil?
    if (g[2] > 0 && g[3] > 0)
      b.draw_rectangle(@bgc, true, 0,0, g[2], g[3])
    end
  end

  def configure_event(w,e)
    g = w.window.get_geometry
    if (g[2] > 0 && g[3] > 0)
      b = Gdk::Pixmap::new(w.window, g[2], g[3], -1)
      clear(b)
      if not @buffer.nil?
        g = @buffer.get_geometry
        b.draw_pixmap(@bgc, @buffer, 0,0,
                      g[0], g[1], g[2], g[3])
      end
      @buffer = b
    end
    true
  end
end
