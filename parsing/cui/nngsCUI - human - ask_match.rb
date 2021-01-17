
  def ask_match(ok, cancel)
    puts 'match requested. accept? (Y/n):'
    STDIN.gets
    user = $_.chop
#puts user
    if not user.scan(/n/).empty?
      @nngs.cmd_match_cancel
    else
      @nngs.cmd_match_ok
    end
  end
