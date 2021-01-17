
  def update(args) 
#    puts "human[#{args[0]}]"
    case args[0]
    when 'login'
      select_user
    when 'request'
      ask_match(args[1], args[2])
    when 'cancel'
      select_user
    when 'scoring'
      @game_master.input 'done'
    when 'end'
      @game_master.logout
      exit
    end
  end
  