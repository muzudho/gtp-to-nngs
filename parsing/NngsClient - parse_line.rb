


  def parse_line(code, line)
    case code
    when 1 # Prompt
      res = parse_1(code, line)
    when 9
      res = parse_9(code, line)
    when 15
      res = parse_15(code, line)
    end

    return res
  end

