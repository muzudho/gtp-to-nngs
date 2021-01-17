
  # Observer
  def match_request(ok, cancel)
    self.changed; self.notify_observers(['request', ok, cancel])
  end
