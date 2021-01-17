



  def cmd_match_ok
    mycolor = @match_accept.split(/ /)[2]
    if mycolor == "W" || mycolor == "w" then
        @color = WHITE
    else
        @color = BLACK
    end
    self.input @match_accept
    if not @match_accept.scan(/match \S+ \S+ (\d+) /).empty?
      @size = $1.to_i
    end
  end
