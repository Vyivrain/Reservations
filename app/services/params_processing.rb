class ParamsProcessing

  def self.time_processing(time)
    time.split(':')
  end

  def self.date_processing(date)
    date.split('-')
  end
end
