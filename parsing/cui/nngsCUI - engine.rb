require './NngsClient'
require './GtpEngine'
require './config'



engine = Class.new
class << engine
  attr_writer :nngs

end
