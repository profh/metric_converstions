require 'minitest/spec'
require 'minitest/autorun'
require '../lib/metric_conversions/areas.rb'
include MetricConversions

describe Area do
  describe 'When given a valid number and units, ' do
    it 'converts the areas correctly' do
      assert_equal 1, Area.convert_mm_to_m(1000)
      assert_equal 1000, Area.convert_m_to_mm(1)
      assert_equal 1000, Area.convert_km_to_m(1)
    end

    it 'outputs a number' do
      assert Area.convert_m_to_mm(1).is_a? Numeric
    end
  end

  describe 'When given an invalid unit, ' do
    it 'throws an exception' do
      assert_raises(ArgumentError) do
        Area.convert_this_to_that(5)
      end
    end
  end

  describe 'When given an invalid number, ' do
    it 'throws and exception' do
      assert_raises(ArgumentError) do
        Area.convert_mm_to_m(true)
      end
    end
  end
end
