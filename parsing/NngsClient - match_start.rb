
  def match_start
    self.changed; self.notify_observers(['start', @color])
  end
