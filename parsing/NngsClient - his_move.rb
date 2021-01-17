

  def his_move(move)
    self.changed; self.notify_observers(['his_move', move])
  end
  