

  def his_turn
    self.changed; self.notify_observers(['his_turn'])
  end
