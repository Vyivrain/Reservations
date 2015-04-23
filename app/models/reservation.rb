class Reservation < ActiveRecord::Base
  validates_presence_of :start_time, :end_time, :table_number

  validate :start_time_cant_be_bigger_than_end_time, :table_cant_be_reserved, :table_cant_be_reserved_for_time_past

  def start_time_cant_be_bigger_than_end_time
    if end_time.to_i <= start_time.to_i
      errors.add(:start_time, "Start time can't be greater or equal end time")
    end
  end

  def table_cant_be_reserved
    Reservation.where(table_number: table_number).each do |e|
      if (start_time != e.end_time && e.start_time != end_time) && (start_time.between?(e.start_time, e.end_time) || end_time.between?(e.start_time, e.end_time) || e.start_time.between?(start_time, end_time) || e.end_time.between?(start_time, end_time))
        errors.add(:table_number, "Table ##{table_number} is already reserved for that time")
        break
      end
    end
  end

  def table_cant_be_reserved_for_time_past
    time = Time.now
    errors.add(:start_time, "I believe in your force young jedi, but you can't reserve table for past time") if time > start_time
  end
end
