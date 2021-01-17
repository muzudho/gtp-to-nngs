
  def expose_event(w,e)
    if ! @buffer.nil?
      rec = e.area
      w.window.draw_pixmap(@bgc, @buffer, rec.x, rec.y,
                           rec.x, rec.y, rec.width, rec.height)
    end
    false
  end
