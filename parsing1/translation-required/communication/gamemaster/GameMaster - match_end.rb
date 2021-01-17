


  def match_end
    self.changed; self.notify_observers(['end'])
  end
