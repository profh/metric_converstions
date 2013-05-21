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
  
  it "should return in mm the number initially given in ft" do
    assert_equal(609.6, 2.convert("ft", "mm"))
  end
  
  it "should return in meters the number initially given in yards" do
    assert_equal(1.83, 2.convert("yd", "m"))
  end
  
  it "should return in km the number initially given in miles" do
    assert_equal(3.22, 2.convert("mi", "km"))
  end
  
  it "should return in yards the number initially given in km" do
    assert_equal(2187.23, 2.convert("km", "yd"))
  end
  
  it "should return in ft the number initially given in m" do
    assert_equal(6.56, 2.convert("m", "ft"))
  end
  
  it "should return in inches the number initially given in mm" do
    assert_equal(17.01, 432.convert("mm", "in"))
  end
  
end