require 'socket'
require 'observer'
require './Ord.rb'

class NNGSClient
  include Observable
  attr_reader :socket, :banner, :white_user, :black_user, :size, :komi, :time, :pass
        # komi is added by sakage 2008/10/25

  BLACK = 0
  WHITE = 1
  


end
