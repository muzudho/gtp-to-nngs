
# `mv` - 指し手。
def decode_coords(mv)

  # 投了
  if mv == "resign"
    "resign"

  # パス
  elsif mv.nil?
    nil

  else
    # I列は欠番なので、整えている？
    i = mv.upcase[0].ord - ?A.ord + 1
    i = i - 1 if i > ?I.ord - ?A.ord
    j = mv[/[0-9]+/].to_i
    [i, j]
  end

end
