module MetricConversions
  def convert(from, to)
    metric_to_english_factors = %w[.04 .4 3.3 1.1 .6]
    english_to_metric_factors = %w[2.5 30 .9 1.6]   

    self.to_inches(from)  
  end

  private
  def to_inches(from)
    if(from == "ft")
        self * 12.0
    elsif(from == "yd")
        self * 36.0
    elsif(from == "mi")
        self * 12.0 * 5280

    elsif(from == "mm")
        self.to_meters / 1000.0
    end
  end

  def to_meters(from)

  end

  def to_feet
    self / 12.0
  end

  def to_yards
    self.to_feet / 3.0
  end

  def to_miles
    self.to_feet / 5280.0
  end

  def to_millimeters
    self * 1000.0
  end

  def to_centimeters
    self * 100.0
  end

  def to_kilometers
    self / 1000.0
  end
end

Integer.send :include(MetricConversions)
