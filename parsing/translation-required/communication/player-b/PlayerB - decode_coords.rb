
# `move_text` - 指し手。
def decode_coords(move_text)

  # 投了
  if move_text == "resign"
    "resign"

  # パス
  elsif move_text.nil?
    nil

  else
    # I列は欠番なので、整えている？
    i = move_text.upcase[0].ord - ?A.ord + 1
    i = i - 1 if i > ?I.ord - ?A.ord
    j = move_text[/[0-9]+/].to_i
    [i, j]
  end

end
