
  def update(args) 
    case args[0]

    when 'start'
      @my_color = case args[1]
                  when GameMaster::BLACK
                    'BLACK'
                  else 
                    'WHITE'
                  end
      @his_color = case args[1]
                  when GameMaster::BLACK
                    'WHITE'
                  else 
                    'BLACK'
                  end
      @player_b = PlayerB.new(@my_color,
                           IO.popen($config['GTP']['command'], "r+"))
      @player_b.newgame(@game_master.size, @game_master.komi, 60*@game_master.time)  # by sakage 2008/10/25, kato 2015/6/29

    when 'my_turn'
      # NNGSから通知された残り時間をプレイヤーに通知します。
      @player_b.time_left('WHITE', @game_master.white_user[2])
      @player_b.time_left('BLACK', @game_master.black_user[2])
      mv, c = @player_b.genmove
      if mv.nil?
        mv = 'PASS'
      elsif mv == "resign"
        
      else
        i, j = mv
        mv = '' << 'ABCDEFGHJKLMNOPQRST'[i-1]
        mv = "#{mv}#{j}"
      end
      @game_master.input mv

    when 'his_move'
      nngsmv = args[1]
      mv = if nngsmv == 'Pass'
             nil
           elsif nngsmv.downcase[/resign/] == "resign"
             "resign"
           else
             i = nngsmv.upcase[0].ord - ?A.ord + 1
	         i = i - 1 if i > ?I.ord - ?A.ord
             j = nngsmv[/[0-9]+/].to_i
             [i, j]
           end
#      p [mv, @his_color]
      @player_b.playmove([mv, @his_color])

    when 'scoring'
      @player_b.quit
    end
  end