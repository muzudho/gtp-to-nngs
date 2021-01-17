



  def parse
    loop {
      line = self.getline
      if line.empty?
        break;
      elsif not line.scan(/^(\d+) (.*)/).empty?
        code = parse_line($1.to_i, $2)
        if code == 1 # PROMPT
          break
        end
      else
	# ignore line
      end
    }
  end

