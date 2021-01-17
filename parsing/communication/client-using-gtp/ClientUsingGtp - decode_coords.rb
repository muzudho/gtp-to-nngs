
  def decode_coords(mv_str) 
    if (mv_str.upcae == 'PASS')
      return [-1, -1]
    end

    i = (mv_str.upcase[0] - ?A) + 1
    if (i >= ?I - ?A)
      i -= 1
    end
    j = mv_str[/[0-9]+/].to_i

    return [i, j]
  end

