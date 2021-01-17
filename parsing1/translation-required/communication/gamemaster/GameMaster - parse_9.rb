
  def parse_9(code, line)
    res = 9
    if ! line.scan(/^Use <match/).empty?
      line.scan(/^Use <(.+?)> or <(.+?)> to respond./)
      @match_accept = $1
      @match_decline = $2
      self.match_request($1, $2)
    elsif ! line.scan(/^Match \[.+?\] with (\S+?) in \S+? accepted./).empty?
      @turn = BLACK
    elsif ! line.scan(/declines your request for a match./).empty?
      self.match_cancel
    elsif ! line.scan(/You decline the match offer from/).empty?
      self.match_cancel
    elsif ! line.scan(/^1 7/).empty?
      res = parse_1(1, '7')
    end

    return res
  end
