
  def play (i, j)
    return false if @color.nil?

    move = encode_coods(i, j)
    p move
    if (@color == 'white')  
      send("play black #{move}\n")
    elsif (@color == 'black')
      send("play white #{move}\n")
    end 
  end
  