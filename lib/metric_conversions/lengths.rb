module MetricConversions

  def round_2
    (self * 100).round / 100.0
  end

  def is_metric?(unit)
    return (unit == "mm" || unit == "cm" || unit == "m" || unit == "km")
  end

  def convert(from, to)
    if(is_metric?(from))
        cm = self.to_cm(from)
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

        else
          inches = cm.to_inches("cm")
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
        inches = self.to_inches(from)

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
      self

    end
  end

  def to_cm(from)
    if(from == "mm")
      self / 10.0

    elsif(from == "cm")
      self

    elsif(from == "m")
      self / 100.0

    elsif(from == "in")
      self * 2.54

    else
      self * 1000.0

    end
  end

  def to_ft
    self / 12.0
  end

  def to_yd
    self.to_feet / 3.0
  end

  def to_mi
    self.to_feet / 5280.0
  end

  def to_mm
    self * 100.0
  end

  def to_m
    self / 100.0
  end

  def to_km
    self / 10000.0
  end
end

(2.class).send(:include, MetricConversions)
((2.54).class).send(:include, MetricConversions)
