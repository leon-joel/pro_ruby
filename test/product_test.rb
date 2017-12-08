require 'minitest/autorun'
require_relative 'test-helper'

require_relative '../lib/product'

class ProductTest < Minitest::Test
  def setup
    @p1 = Product.new('A-001', 'A Product', 1000)
    @p2 = Product.new('B-001', 'B Product', 1000)
    @p3 = Product.new('A-001', 'another A Product', 1000)
  end

  def test_operator_equal
    assert_equal @p3, @p1
  end
  def test_equal
    refute @p1.equal?(@p3)
  end
end