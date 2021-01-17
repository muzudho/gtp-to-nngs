

  def set_boardsize(size) 
    @moves = []
    @boardsize = size
    g = self.window.get_geometry
    if (g[2] > 0 && g[3] > 0)
      b = Gdk::Pixmap::new(self.window, g[2], g[3], -1)
      clear(b)
      @buffer = b
      self.window.draw_pixmap(@bgc, @buffer, 0,0,
                              g[0], g[1], g[2], g[3])
    end
  end
