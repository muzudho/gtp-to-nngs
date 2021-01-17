
  def initialize
    super
    signal_connect("expose_event") { |w,e| expose_event(w,e) }
    signal_connect("configure_event") { |w, e| configure_event(w,e) }
    signal_connect("button_press_event") { |w,e| pressed(w,e) }
    set_events(Gdk::BUTTON_PRESS_MASK)

    @buffer = nil
    @bgc = nil
    @fgc = nil
    @boardsize = 9
    @moves = []

    set_usize(400, 400)
#    set_boardsize(9)
  end
