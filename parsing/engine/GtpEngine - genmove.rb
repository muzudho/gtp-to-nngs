

  def genmove
    rcv = send("genmove #{@color}\n")
    tmp = rcv.downcase[/resign/]
    if tmp == "resign"
       #move = "resign"
       return ["resign" , @color]
    else
       move = rcv[/[a-zA-Z][0-9]+/]
    end
    [decode_coords(move), @color]
  end
