
  def encode_coods(i, j)
    if (i == -1 && j == -1) 
      return 'PASS'
    end
      
    if (i >= ?I - ?A)
      i += 1
    end
      
    return '' << (?A + i) << j    
  end
