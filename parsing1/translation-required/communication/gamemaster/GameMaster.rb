require 'socket'
require 'observer'
require './Ord.rb'

# Rename 'NNGSClient' to 'GameMaster'.
class GameMaster
  include Observable
  attr_reader :socket, :banner, :white_user, :black_user, :size, :komi, :time, :pass
        # komi is added by sakage 2008/10/25

  BLACK = 0
  WHITE = 1
  


end
