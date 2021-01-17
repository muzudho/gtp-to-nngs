


def genmove
  rcv = send("genmove #{@color}\n")

  tmp = rcv.downcase[/resign/]

  # 投了と色
  if tmp == "resign"
    #move = "resign"
    return ["resign" , @color]

  else
    move = rcv[/[a-zA-Z][0-9]+/]
  end

  # 座標と色
  [decode_coords(move), @color]
end
