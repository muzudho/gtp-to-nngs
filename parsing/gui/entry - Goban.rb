#! /usr/bin/env ruby -Ke

require 'gtk'


class Goban < Canvas
  
  def initialize
    super
    set_usize(400, 400)
    signal_connect("button_press_event") { |w,e| pressed(w,e) }
    set_events(Gdk::BUTTON_PRESS_MASK)
  end

  

  def pressed(widget, ev)
    if not @last.nil?
      @buffer.draw_line(widget.style.fg_gc(widget.state),
                        @last.x, @last.y, ev.x, ev.y)

      x1,x2 = if (@last.x < ev.x)
              then [@last.x, ev.x]
              else [ev.x,    @last.x]
              end
      y1,y2 = if (@last.y < ev.y)
            then [@last.y, ev.y]
            else [ev.y,    @last.y]
            end
      widget.draw(Gdk::Rectangle.new(x1,y1,x2-x1+1,y2-y1+1))
    end
    @last = nil
    @last = ev
    true
  end
end
