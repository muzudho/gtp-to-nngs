require 'socket'
require 'observer'
require './Ord.rb'

class NNGSClient
  include Observable
  attr_reader :socket, :banner, :white_user, :black_user, :size, :komi, :time, :pass
        # komi is added by sakage 2008/10/25

  BLACK = 0
  WHITE = 1
  
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

  # Observer
  def match_request(ok, cancel)
    self.changed; self.notify_observers(['request', ok, cancel])
  end

  def match_cancel
    self.changed; self.notify_observers(['cancel'])
  end

  def match_start
    self.changed; self.notify_observers(['start', @color])
  end

  def match_scoring
    self.changed; self.notify_observers(['scoring'])
  end

  def match_end
    self.changed; self.notify_observers(['end'])
  end

  def my_turn
    self.changed; self.notify_observers(['my_turn'])
  end

  def my_move(move)
    self.changed; self.notify_observers(['my_move', move])
  end

  def undo
    self.changed; self.notify_observers(['undo'])
  end
  
  def his_turn
    self.changed; self.notify_observers(['his_turn'])
  end

  def his_move(move)
    self.changed; self.notify_observers(['his_move', move])
  end
  
  # (^q^) Client に状況を転送
  def logined
    self.changed; self.notify_observers(['login'])
  end
  
  def logouted
    self.changed; self.notify_observers(['logout'])
  end
  #

  # (^q^) 指定の文字列を含む行がくるまで待っている？
  # * `str` - 正規表現で指定できる。
  def waitfor(str)
    reply = ''
    until reply =~ str
      c = @socket.getc
      raise(IOError,"Socket not opened") if c.nil?
      next if c.ord > 127 or c.ord == 1
      reply << c unless c == ?\r
      if c == ?\n
        @banner << reply
        @lastline = reply
        reply = ''
      end
    end
    @lastline=reply
  end

  # (^q^) ログインします。
  def login
    @banner=''

    @socket=TCPSocket.new(@server, @port)

    waitfor(/Login: /)
    @socket.puts(@user)

    # パスワードの求められ方が２パターン、求められないパターンが１つある？
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

    # (^q^) 何かオプション設定
    @socket.puts('set client true')
    # @socket.puts('set shout false')

    self.logined
  end

  # (^q^) NNGSから離脱する？
  def logout
    @socket.puts('quit')
    @socket.close
    self.logouted
  end

  # (^q^) 行頭が 9 という数字（＝マッチング待ち中の状態？）で始まったとき。
  def parse_9(code, line)
    # (^q^) 人が読む表示を、簡単な形へ 再表示する。
    res = 9
    if ! line.scan(/^Use <match/).empty?
      line.scan(/^Use <(.+?)> or <(.+?)> to respond./)
      @match_accept = $1
      @match_decline = $2
      self.match_request($1, $2)
    
    elsif ! line.scan(/^Match \[.+?\] with (\S+?) in \S+? accepted./).empty?
      @turn = BLACK
    
    # (^q^) マッチがキャンセルされた。
    elsif ! line.scan(/declines your request for a match./).empty?
      self.match_cancel
    
    # (^q^) マッチがキャンセルされた。
    elsif ! line.scan(/You decline the match offer from/).empty?
      self.match_cancel
    
    # (^q^) "9 1 7" という数字列が送られてくるのか……☆？
    elsif ! line.scan(/^1 7/).empty?
      res = parse_1(1, '7')
    
    end

    return res
  end

  # (^q^) 行頭が 15 という数字（＝対局中の状態？）で始まったとき。
  def parse_15(code, line)
    # (^q^) マッチ確立の合図を得た。
    if ! line.scan(/Game (\d+) ([a-zA-Z]): (\S+) \((\S+) (\S+) (\S+)\) vs (\S+) \((\S+) (\S+) (\S+)\)/).empty?
      @gameid = $1
      @gametype = $2
      @white_user = [$3, $4, $5, $6]
      @black_user = [$7, $8, $9, $10]

    # (^q^) 指し手？
    elsif ! line.scan(/\s*(\d+)\(([BWbw])\): ([A-Z]\d+|Pass)/).empty?
      @lastmove = [$1, $2, $3]
      case $2
      when 'B'
        @turn = WHITE
      when 'W'
        @turn = BLACK
      end

      case @color
      # (^q^) 手番なら
      when @turn
        self.his_move(@lastmove[2])
        self.my_turn
      # (^q^) 相手の番なら
      else
        self.my_move(@lastmove[2])
        self.his_turn
      end
    end

    return 15
  end

  # (^q^) コードが1のとき。
  def parse_1(code, line)
    # (^q^) 2重に 状態遷移をしている。 '@prompt' には現在表示中の数(終わった数)が入る？
    case line.to_i
    when 5
      if @prompt == 7
        self.match_end
      end
      @prompt = 5

    when 6
      # (^q^) マッチの開始？
      if @prompt == 5
        self.match_start

        case @color
        # 手番
        when @turn
          self.my_turn
        # 相手の番
        else
          self.his_turn
        end
      end
      @prompt = 6

    when 7
      if @prompt == 6
        self.match_scoring
      end
      @prompt = 7
    end

    return 1
  end

  # (^q^) コマンド行をパースする。
  def parse_line(code, line)
    case code
    when 1 # Prompt
      res = parse_1(code, line)
    when 9
      res = parse_9(code, line)
    when 15
      res = parse_15(code, line)
    end

    return res
  end


  def input(cmd)
    puts "NNGS <- #{cmd}"
    @socket.puts cmd
  end

  def getline
    line = @socket.gets("\r\n").chop
    puts  "NNGS -> #{line}"
    line
  end

  # (^q^) メインループの中で呼び出される小さなループ。
  def parse
    loop {
      line = self.getline
      if line.empty?
        break;

      # (^q^) コマンド行？
      elsif not line.scan(/^(\d+) (.*)/).empty?
        code = parse_line($1.to_i, $2)
        if code == 1 # PROMPT
          break
        end
      else
	# ignore line
      end
    }
  end


  def cmd_match(usr) 
    temp = usr.split(/ /)
    nm = temp[0]
    mycolor = temp[1]
    # 2010/8/25 added by manabe (set color)
    if mycolor == "W" || mycolor == "w" then
        @color = WHITE
        self.input "match #{nm} W #{@size} #{@time} #{@byo_yomi}"
    else
        @color = BLACK
        self.input "match #{nm} B #{@size} #{@time} #{@byo_yomi}"
    end
  end

  def cmd_match_ok
    mycolor = @match_accept.split(/ /)[2]
    if mycolor == "W" || mycolor == "w" then
        @color = WHITE
    else
        @color = BLACK
    end
    self.input @match_accept
    if not @match_accept.scan(/match \S+ \S+ (\d+) /).empty?
      @size = $1.to_i
    end
  end

  def cmd_match_cancel
    self.input @match_decline
  end
end
