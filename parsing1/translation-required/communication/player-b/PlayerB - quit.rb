
  # サーバーが、思考エンジンを終了させるのに使います。
  def quit
    send("quit\n")
    @sock_io.close
  end