
  def select_user
    puts 'input user:'
    STDIN.gets
    user = $_.chop
    if user.empty?
      puts 'wating match request.'
    else
      @game_master.cmd_match user
    end
  end
