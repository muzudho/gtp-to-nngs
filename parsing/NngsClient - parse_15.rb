

  def parse_15(code, line)
    if ! line.scan(/Game (\d+) ([a-zA-Z]): (\S+) \((\S+) (\S+) (\S+)\) vs (\S+) \((\S+) (\S+) (\S+)\)/).empty?
      @gameid = $1
      @gametype = $2
      @white_user = [$3, $4, $5, $6]
      @black_user = [$7, $8, $9, $10]

    elsif ! line.scan(/\s*(\d+)\(([BWbw])\): ([A-Z]\d+|Pass)/).empty?
      @lastmove = [$1, $2, $3]
      case $2
      when 'B'
        @turn = WHITE
      when 'W'
        @turn = BLACK
      end

      case @color
      when @turn
        self.his_move(@lastmove[2])
        self.my_turn
      else
        self.my_move(@lastmove[2])
        self.his_turn
      end
    end

    return 15
  end
