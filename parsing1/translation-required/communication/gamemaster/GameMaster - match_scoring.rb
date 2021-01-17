
  def match_scoring
    self.changed; self.notify_observers(['scoring'])
  end
