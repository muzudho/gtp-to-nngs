
  def genmove
    # 手番が未指定なら終わり。
    return false if @color.nil?

    mv = send("genmove #{@color}\n")
    decode_coords(mv[/[a-zA-Z][0-9]+/])
  end
