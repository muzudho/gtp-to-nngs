
  # 座標、またはパス
  def encode_coords(mv)
    # パス
    if mv.nil?
      "PASS"

    else
      # I列は欠番なので、整えている？
      i = mv[0]
      j = mv[1]
      is = '' << 'ABCDEFGHJKLMNOPQRSTUVWXYZ'[i - 1]
      "#{is}#{j}"
    end
  end
