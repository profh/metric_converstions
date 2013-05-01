require 'minitest/spec'
require 'minitest/autorun'
require '../metric_conversions/lengths.rb'

describe "lengths conversions" do
  it "should return in inches the number initially given in feet" do
    assert_equal(12, 1.convert("ft", "in"))
    assert_equal(18, 1.5.convert("ft", "in"))
  end
  
  it "should return in centimeters the number initially given in inches" do
    assert_equal(2.54, 1.convert("in", "cm"))
    assert_equal(635, 250.convert("in", "cm"))
  end
  
  it "should return in inches the number initially given in centimeters" do
    assert_equal(1, 2.54.convert("cm", "in"))
    assert_equal(196.85, 500.convert("cm", "in"))
  end
  
  it "should return in cm the number initially given in feet" do
    assert_equal(91.44, 3.convert("ft", "cm"))
    assert_equal(60.96, 2.convert("ft", "cm"))
  end
  
  it "should return in cm the number initially given in miles" do
    assert_equal(321868.8, 2.convert("mi", "cm"))
  end
  
end