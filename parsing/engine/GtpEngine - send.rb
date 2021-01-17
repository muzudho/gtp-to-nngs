
# 送信
def send(s)
  return unless @io
  puts " GTP <- #{s}"
  @io.puts(s)
  receive
end
