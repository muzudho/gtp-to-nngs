
  def genmove
    return false if @color.nil?
    mv = send("genmove #{@color}\n")
    decode_coords(mv[/[a-zA-Z][0-9]+/])
  end
