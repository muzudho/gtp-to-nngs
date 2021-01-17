
# 受信
def receive
  return unless @sock_io
  rcv = ''

  while (gtp_command = @sock_io.gets) 
    puts " GTP -> #{gtp_command}"
    rcv += gtp_command
    if gtp_command == "\n"
      break
    end
  end
  rcv
end
