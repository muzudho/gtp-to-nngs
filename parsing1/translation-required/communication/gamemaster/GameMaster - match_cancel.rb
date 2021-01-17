
  def match_cancel
    self.changed; self.notify_observers(['cancel'])
  end
