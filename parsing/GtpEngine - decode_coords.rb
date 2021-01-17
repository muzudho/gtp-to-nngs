
  def decode_coords(mv)
    if mv == "resign"
      "resign"
    elsif mv.nil?
      nil
    else
      i = mv.upcase[0].ord - ?A.ord + 1
      i = i - 1 if i > ?I.ord - ?A.ord
      j = mv[/[0-9]+/].to_i
      [i, j]
    end
  end
