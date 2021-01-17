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
