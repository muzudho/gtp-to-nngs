
  def initialize
    super
    set_usize(400, 400)
    signal_connect("button_press_event") { |w,e| pressed(w,e) }
    set_events(Gdk::BUTTON_PRESS_MASK)
  end
