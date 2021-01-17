

  
  def logined
    self.changed; self.notify_observers(['login'])
  end
  