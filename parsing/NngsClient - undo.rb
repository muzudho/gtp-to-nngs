

  def undo
    self.changed; self.notify_observers(['undo'])
  end
  