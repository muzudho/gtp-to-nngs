

# サーバーが コンピューター囲碁ソフトに どちらの手番かを伝えるのに使う？
def genmove
  # `rcv` - 受信チャンネル
  rcv = send("genmove #{@color}\n")

  tmp = rcv.downcase[/resign/]

  if tmp == "resign"
    # 投了と色
    #move = "resign"
    return ["resign" , @color]

  else
    move = rcv[/[a-zA-Z][0-9]+/]
  end

  # 座標と色
  [decode_coords(move), @color]
end
