
# 送信
def send(gtp_command)
  return unless @sock_io
  puts " GTP <- #{gtp_command}"
  @sock_io.puts(gtp_command)
  receive
end
