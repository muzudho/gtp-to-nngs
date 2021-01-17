require './NngsClient'
require './Player'
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


nngs = GameMaster.new(server,
		      $config['NNGS']['port'],
		      user,
		      $config['NNGS']['pass'],
		      $config['SIZE'],
		      $config['TIME'],
		      $config['KOMI'],          # added by sakage 2008/10/25
		      $config['BYO_YOMI']);     # added by iwakawa 2010/5/19





nngs.add_observer(announce)
nngs.add_observer(engine)
engine.nngs= nngs
nngs.add_observer(human)
human.nngs= nngs

nngs.login
#t = Thread.new {
#  begin
    while res = select([nngs.socket], nil, nil, nil)
      nngs.parse
    end
#  rescue Exception

#  end
#}
#t.join
