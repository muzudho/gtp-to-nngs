
  def initialize(prog="/usr/games/bin/gnugo --mode gtp --quiet")
    @program=prog
    @sock_io = nil
    @playeralistener = []
    @color = nil
    @boardsize = 0
    @komi = 0
  end
