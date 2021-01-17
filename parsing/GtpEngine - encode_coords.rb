
  def encode_coords(mv)
    if mv.nil?
      "PASS"
    else
      i = mv[0]
      j = mv[1]
      is = '' << 'ABCDEFGHJKLMNOPQRSTUVWXYZ'[i - 1]
      "#{is}#{j}"
    end
  end
