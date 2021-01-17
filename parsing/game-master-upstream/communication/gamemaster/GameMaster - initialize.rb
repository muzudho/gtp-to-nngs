
  def initialize(server, port, user, pass, size, time, komi, byo_yomi)
        # byo_yomi is added by iwakawa 2010/5/19
    @server = server
    @port = port.to_i
    @user = user
    @pass = pass
    @size = size
    @time = time
    @socket = nil
    @komi = komi            #add by sakage 2008/10/25
    @byo_yomi = byo_yomi    #add by iwakawa 2010/5/19
  end
