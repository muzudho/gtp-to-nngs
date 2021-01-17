
  # 座標、またはパス
  def encode_coords(move_text)
    # パス
    if move_text.nil?
      "PASS"

    else
      # I列は欠番なので、整えている？
      i = move_text[0]
      j = move_text[1]
      is = '' << 'ABCDEFGHJKLMNOPQRSTUVWXYZ'[i - 1]
      "#{is}#{j}"
    end
  end
