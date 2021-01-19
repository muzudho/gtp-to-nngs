$config = {
  'NNGS' => {
    'server'=>'localhost',
#    'server'=>'jsb.cs.uec.ac.jp',
#    'server'=>'nngs.computer-go.jp',
#    'server'=>'192.168.1.1',
    'port'=>'9696',
    'user'=>'Kifuwarabe_UEC12_b',    # your account
#    'user'=>'zen01',    # your account
    'pass'=>'zen'       # your password (any)
  },
  'GTP' => {            # command to start your program
    'command'=>'"C:\Users\むずでょ\go\src\github.com\muzudho\kifuwarabe-uec12\kifuwarabe-uec12.exe"'
#    'command'=>'zen-10.4 --threads=1 --games=999999 --memory=400'
#    'command'=>'/home/yss/aya/ayamc -gtp'
#    'command'=>'/usr/games/bin/gnugo --mode gtp --quiet'
  },
  'SIZE' => 9,
  'TIME' => 15,         # minutes
  'KOMI' => 7.0,
  'BYO_YOMI' => 0
}
