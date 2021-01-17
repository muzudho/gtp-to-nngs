
  def my_turn
    self.changed; self.notify_observers(['my_turn'])
  end
