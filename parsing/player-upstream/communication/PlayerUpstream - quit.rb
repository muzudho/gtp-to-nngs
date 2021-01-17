
  # サーバーが、思考エンジンを終了させるのに使います。
  def quit
    send("quit\n")
    @io.close
  end