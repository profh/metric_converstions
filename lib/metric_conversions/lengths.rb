module MetricConversions

  # rounds a number to 2 digits
  def round_2
    (self * 100).round / 100.0
  end

  # determines if a given unit is metric
  def is_metric?(unit)
    return (unit == "mm" || unit == "cm" || unit == "m" || unit == "km")
  end

  # performs the actual unit length conversion given a value 
  def convert(from, to)
    # if we are converting from a metric value
    if(is_metric?(from))
        # because from is metric, convert to centimeters
        cm = self.to_cm(from)

        # if we are converting to a metric value, convert the value
        if(is_metric?(to))
          if(to == "mm")
            cm.to_mm.round_2

          elsif(to == "cm")
            cm.round_2

          elsif(to == "m")
            cm.to_m.round_2

          elsif(to == "km")
            cm.to_km.round_2
          end

        # the value we are converting to is not metric, so convert the value to inches
        else
          inches = cm.to_inches("cm")

          # if we are converting to English values, perform the conversion
          if(to == "in")
            inches.round_2

          elsif(to == "ft")
            inches.to_ft.round_2

          elsif(to == "yd")
            inches.to_yd.round_2

          elsif(to == "mi")
            inches.to_mi.round_2
          end
        end

    else
        # the value we are converting from is not metric
        inches = self.to_inches(from)

        # if the value we are converting to is metric, convert inches to centimeters and make the final conversion
        if(is_metric?(to))
          cm = inches.to_cm("in")
        
          if(to == "mm")
            cm.to_mm.round_2

          elsif(to == "cm")
            cm.round_2

          elsif(to == "m")
            cm.to_m.round_2

          elsif(to == "km")
            cm.to_km.round_2
          end

        # the value we are converting to is in the English system, so perform the conversion
        else
          if(to == "in")
            inches.round_2

          elsif(to == "ft")
            inches.to_ft.round_2

          elsif(to == "yd")
            inches.to_yd.round_2
            
          elsif(to == "mi")
            inches.to_mi.round_2
          end
        end
    end
  end

  # given a from value, convert it to inches
  def to_inches(from)
    if(from == "ft")
      self * 12.0

    elsif(from == "yd")
      self * 36.0

    elsif(from == "mi")
      self * 12.0 * 5280

    elsif(from == "cm")
      self / 2.54

    elsif(from == "in")
      self * 1.0

    end
  end

  # given a from value, convert it to centimeters
  def to_cm(from)
    if(from == "mm")
      self / 10.0

    elsif(from == "cm")
      self * 1.0

    elsif(from == "m")
      self * 100.0

    elsif(from == "in")
      self * 2.54

    else
      self * 100000.0

    end
  end

  # given inches, convert to feet
  def to_ft
    self / 12.0
  end

  # given inches, convert to yards
  def to_yd
    self.to_ft / 3.0
  end

  # given inches, convert to miles
  def to_mi
    self.to_ft / 5280.0
  end

  # given centimeters, convert to millimeters
  def to_mm
    self * 10.0
  end

  # given centimeters, convert to meters
  def to_m
    self / 100.0
  end

  # given centimeters, convert to kilometers
  def to_km
    self / 100000.0
  end
end

(2.class).send(:include, MetricConversions)
((2.54).class).send(:include, MetricConversions)