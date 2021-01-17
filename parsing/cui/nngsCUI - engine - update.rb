
  def update(args) 
    case args[0]

    when 'start'
      @my_color = case args[1]
                  when NNGSClient::BLACK
                    'BLACK'
                  else 
                    'WHITE'
                  end
      @his_color = case args[1]
                  when NNGSClient::BLACK
                    'WHITE'
                  else 
                    'BLACK'
                  end
      @gtp = Player.new(@my_color,
                           IO.popen($config['GTP']['command'], "r+"))
      @gtp.newgame(@nngs.size, @nngs.komi, 60*@nngs.time)  # by sakage 2008/10/25, kato 2015/6/29

    when 'my_turn'
      @gtp.time_left('WHITE', @nngs.white_user[2])
      @gtp.time_left('BLACK', @nngs.black_user[2])
      mv, c = @gtp.genmove
      if mv.nil?
        mv = 'PASS'
      elsif mv == "resign"
        
      else
        i, j = mv
        mv = '' << 'ABCDEFGHJKLMNOPQRST'[i-1]
        mv = "#{mv}#{j}"
      end
      @nngs.input mv

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
      @gtp.playmove([mv, @his_color])

    when 'scoring'
      @gtp.quit
    end
  end