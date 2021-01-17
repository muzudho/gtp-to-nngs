
  def clear(b = @buffer)
    return if b.nil?

    g = b.get_geometry
    @bgc = self.style.bg_gc(self.state) if @bgc.nil?
    if (g[2] > 0 && g[3] > 0)
      b.draw_rectangle(@bgc, true, 0,0, g[2], g[3])
    end
  end
