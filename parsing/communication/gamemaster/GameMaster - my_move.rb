

  def my_move(move)
    self.changed; self.notify_observers(['my_move', move])
  end
