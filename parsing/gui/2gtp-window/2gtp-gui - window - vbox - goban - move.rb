
  def move(mv)
    p mv
    coords = mv[0]
    color = mv[1]
    if ! coords.nil?
      p coords
      draw_move(color, coords[0], coords[1])
    end
  end

