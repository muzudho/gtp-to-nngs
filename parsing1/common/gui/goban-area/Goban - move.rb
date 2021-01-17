

  def move(color, i, j)
    p  [color, i, j]
    @moves << [color, i, j]

#    @moves.each { | a, b, c |
#      p [a, b, c]
#    }
    draw_move(color, i, j)
  end
