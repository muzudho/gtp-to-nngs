
  # GNU go をスタートさせる☆（＾～＾）？
  def start(text)
#      prog="/home/kubo/tmp/nngs/clients/gtp_skel/sample"
    prog="/usr/games/bin/gnugo --mode gtp --quiet"

    # 読取モードの追加☆（＾～＾）？
    @io = IO.popen(prog, "r+")

    @text = text
  end
