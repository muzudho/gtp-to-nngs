
  def login
    @banner=''

    @socket=TCPSocket.new(@server, @port)

    waitfor(/Login: /)
    @socket.puts(@user)
    waitfor(/1 1|Password: |#> /)

    if  @lastline =~ /1 1/
      raise(RuntimeError,"Need password") if pass.nil?
      @socket.puts(@pass)
    elsif  @lastline =~ /Password: /
      raise(RuntimeError, "Need password") if pass.nil?
      @socket.puts(@pass)
      waitfor(/#> /)
    elsif @lastline =~ /#>/
    end

    @socket.puts('set client true')
    # @socket.puts('set shout false')

    self.logined
  end
