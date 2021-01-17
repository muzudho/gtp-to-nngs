
# 受信
def receive
  return unless @io
  rcv = ''

  while (gtp_command = @io.gets) 
    puts " GTP -> #{gtp_command}"
    rcv += gtp_command
    if gtp_command == "\n"
      break
    end
  end
  rcv
end
