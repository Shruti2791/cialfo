require_relative '../lib/comparable'

class MyCalender
  include Comparable

  def self.overlapping?(gcal_slot, ical_slot)
    if gcal_slot[:start] == ical_slot[:start] && gcal_slot[:end] == ical_slot[:end]
      true
    else
      (((gcal_slot[:start]).inbetween?(ical_slot[:start], ical_slot[:end])) || ((gcal_slot[:end]).inbetween?(ical_slot[:start], ical_slot[:end])) || 
      ((ical_slot[:start]).inbetween?(gcal_slot[:start], gcal_slot[:end])) || ((ical_slot[:end]).inbetween?(gcal_slot[:start], gcal_slot[:end])))
    end
  end

  def self.get_free_slots(gcal, ical)
    gcal.each do |gcal_slot|
      ical.each do |ical_slot|
        if !ical_slot[:marked_overlap] && overlapping?(gcal_slot, ical_slot)
          gcal_slot[:start] = [ical_slot[:start], gcal_slot[:start]].min
          gcal_slot[:end] = [ical_slot[:end], gcal_slot[:end]].max
          ical_slot[:marked_overlap] = true
        end
      end
    end
    (gcal + ical).select { |slot| !slot[:marked_overlap] }.sort_by { |slot| slot[:start] }
  end
end
