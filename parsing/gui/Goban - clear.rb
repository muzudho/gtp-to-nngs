

  def clear(b = @buffer)
    return if b.nil?

    g = b.get_geometry
    @bgc = self.style.bg_gc(self.state) if @bgc.nil?
    @fgc = self.style.fg_gc(self.state) if @fgc.nil?
    if (g[2] > 0 && g[3] > 0)
      b.draw_rectangle(@bgc, true, 0,0, g[2], g[3])

      width = if (g[2] < g[3])
              then g[2]
              else g[3]
              end
      @cell_w = (width - 2 * @@margin) / @boardsize
      o = @@margin + @cell_w / 2
      e =  o + (@boardsize - 1) * @cell_w

      (1..@boardsize).each { |i|
        pp = o + (i - 1) * @cell_w
        b.draw_line(@fgc, o, pp, e, pp)
        b.draw_line(@fgc, pp, o, pp, e)
      }
    end
  end
