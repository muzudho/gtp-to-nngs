

  def cmd_match(usr) 
    temp = usr.split(/ /)
    nm = temp[0]
    mycolor = temp[1]
    # 2010/8/25 added by manabe (set color)
    if mycolor == "W" || mycolor == "w" then
        @color = WHITE
        self.input "match #{nm} W #{@size} #{@time} #{@byo_yomi}"
    else
        @color = BLACK
        self.input "match #{nm} B #{@size} #{@time} #{@byo_yomi}"
    end
  end
