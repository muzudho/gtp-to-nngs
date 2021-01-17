


  def parse_1(code, line)
    case line.to_i
    when 5
      if @prompt == 7
        self.match_end
      end
      @prompt = 5

    when 6
      if @prompt == 5
        self.match_start
	case @color
	when @turn
	  self.my_turn
	else
	  self.his_turn
	end
      end
      @prompt = 6

    when 7
      if @prompt == 6
        self.match_scoring
      end
      @prompt = 7
    end

    return 1
  end
