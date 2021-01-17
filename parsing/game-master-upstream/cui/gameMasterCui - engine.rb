

engine = Class.new
class << engine
  # @game_master へ書込み可。
  attr_writer :game_master

end
