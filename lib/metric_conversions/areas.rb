require 'rubygems'
require 'ruby-units'

module MetricConversions
  class Area
    def self.method_missing(name, *args)
      if name =~ /convert_\w+_to_\w+/
        unit1, unit2 = name.to_s.scan(/convert_(\w+)_to_(\w+)/).first[0..1]
        
        convert(args[0], unit1, unit2)
      else
        super
      end
    end

    def self.convert(num1, unit1, unit2)
      if Unit(unit1) && Unit(unit2) && Unit(unit1).compatible?(Unit(unit2)) && num1.to_i
        Unit(num1.to_s + ' ' + unit1).convert_to(unit2).to_int
      else
        throw InvalidUnitException
      end
    end
  end

  class InvalidUnitException < Exception
    def message
      "Unit is invalid"
    end
  end
end
