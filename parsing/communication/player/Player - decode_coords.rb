
  # 指し手の文字列
  def decode_coords(move_text) 
    if (move_text.upcae == 'PASS')
      return [-1, -1]
    end

    # 大文字にする。
    # I列 が欠番なので調整。
    i = (move_text.upcase[0] - ?A) + 1
    if (i >= ?I - ?A)
      i -= 1
    end
    j = move_text[/[0-9]+/].to_i

    return [i, j]
  end

