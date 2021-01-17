$config = {
  'NNGS' => {
    'server'=>'jsb.cs.uec.ac.jp',
#    'server'=>'nngs.computer-go.jp',
#    'server'=>'192.168.1.1',
    'port'=>'9696',
    'user'=>'zen01',    # your account
    'pass'=>'zen'       # your password (any)
  },
  'GTP' => {            # command to start your program
    'command'=>'zen-10.4 --threads=1 --games=999999 --memory=400'
#    'command'=>'/home/yss/aya/ayamc -gtp'
#    'command'=>'/usr/games/bin/gnugo --mode gtp --quiet'
  },
  'SIZE' => 9,
  'TIME' => 15,         # minutes
  'KOMI' => 7.0,
  'BYO_YOMI' => 0
}
