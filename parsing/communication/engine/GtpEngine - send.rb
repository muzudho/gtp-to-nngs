
# 送信
def send(gtp_command)
  return unless @io
  puts " GTP <- #{gtp_command}"
  @io.puts(gtp_command)
  receive
end
