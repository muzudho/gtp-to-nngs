
  def draw_move(color, i, j)
    p ['dm', color, i, j]
    x = @@margin + (@cell_w / 2 ) + (i - 1) * @cell_w - @cell_w * 0.4
    y = @@margin + (@cell_w / 2 ) + (@boardsize - j) * @cell_w - @cell_w * 0.4
    if (color.upcase=='BLACK') 
        @buffer.draw_arc(@fgc, true, x, y, @cell_w * 0.8, @cell_w * 0.8, 0, 360*64)
    elsif (color.upcase=='WHITE') 
      @buffer.draw_arc(@bgc, true, x, y, @cell_w * 0.8, @cell_w * 0.8, 0, 360*64)
      @buffer.draw_arc(@fgc, false, x, y, @cell_w * 0.8, @cell_w * 0.8, 0, 360*64)
    end
    g = @buffer.get_geometry
    self.window.draw_pixmap(@bgc, @buffer, x, y, x, y, @cell_w, @cell_w)
    p ['dm', color, i, j, 'end']
  end

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
