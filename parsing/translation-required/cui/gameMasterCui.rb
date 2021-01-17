require './NngsClient'
require './config'

user = if ARGV[0].nil?
	 $config['NNGS']['user']
       else
	 ARGV[0]
       end

server = if ARGV[1].nil?
	   $config['NNGS']['server']
	 else
	   ARGV[1]
	 end

# (^q^) NNGS.
game_master = GameMaster.new(server,
		      $config['NNGS']['port'],
		      user,
		      $config['NNGS']['pass'],
		      $config['SIZE'],
		      $config['TIME'],
		      $config['KOMI'],          # added by sakage 2008/10/25
		      $config['BYO_YOMI']);     # added by iwakawa 2010/5/19





game_master.add_observer(announce)

game_master.add_observer(engine)
engine.game_master= game_master

game_master.add_observer(human)
human.game_master= game_master

game_master.login
#t = Thread.new {
#  begin
    while res = select([game_master.socket], nil, nil, nil)
      game_master.parse
    end
#  rescue Exception

#  end
#}
#t.join
