
$config = {
  'NNGS' => {
    'server'=>'nngs1.heroz.jp',
#    'server'=>'nngs.computer-go.jp',
#    'server'=>'192.168.1.1',
    'port'=>'9696',
    'user'=>'test1',    # your account
#   'pass'=>'secret'    # your password (any)
  },
  'GTP' => {            # command to start your program
#    'command'=>'/nfs/naraki/pachi/pachi'
#    'command'=>'/nfs/naraki/leela_0100_linux_x64 -g -t 1 -p 100 --noponder'
#    'command'=>'/work/naraki/Ray2016_19x19/Kishin --playout 10000'  
#    'command'=>'/home/yss/aya/ayamc -gtp'
    'command'=>'/usr/games/bin/gnugo --mode gtp --quiet'
  },
  'SIZE' => 19,
  'TIME' => 30,         # minutes
  'KOMI' => 6.5,
  'BYO_YOMI' => 0
}
