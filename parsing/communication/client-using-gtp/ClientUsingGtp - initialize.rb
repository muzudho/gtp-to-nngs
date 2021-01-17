
  def initialize(prog="/usr/games/bin/gnugo --mode gtp --quiet")
    @program=prog
    @io = nil
    @clientlistenergtp = []
    @color = nil
    @boardsize = 0
    @komi = 0
  end
