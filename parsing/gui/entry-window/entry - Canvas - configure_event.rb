
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
