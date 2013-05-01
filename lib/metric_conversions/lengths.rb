module MetricConversions
  def convert(from, to)
    metric_to_english_factors = %w[.04 .4 3.3 1.1 .6]
    english_to_metric_factors = %w[2.5 30 .9 1.6] 

    def is_metric?(unit)
        return (unit == "mm" || unit == "cm" || unit == "m" || unit == "km")
    end

    if(is_metric?(from))
        cm = self.to_cm
        if(is_metric?(to))
          if(to == "mm")
            cm.to_mm
          elsif(to == "cm")
            cm
          elsif(to == "m")
            cm.to_m
          elsif(to == "km")
            cm.to_km
          end
        else
            inches = cm.to_inches("cm")
            if(to == "in")
              inches
            elsif(to == "ft")
              inches.to_ft
            elsif(to == "yd")
              inches.to_yd
            elsif(to == "mi")
              inches.to_mi
            end
        end
    # else
    #     inches = self.to_inches(from)

    #     if(is_metric?(to))
    #       # convert inches to metric

    #     else
    #       # convert inches to desired english value

    #     end
    end

  def to_inches(from)
    if(from == "ft")
        self * 12.0
    elsif(from == "yd")
        self * 36.0
    elsif(from == "mi")
        self * 12.0 * 5280

    elsif(from == "cm")
        self / 2.5
    end
  end

  def to_cm(from)
    if(from == "mm")
        self / 1000.0

    elsif(from == "cm")
        self / 100.0

    elsif(from == "m")
        self * 1.0

    elsif(from == "in")
        self * 2.5

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
