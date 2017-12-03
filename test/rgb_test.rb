require 'minitest/autorun'
require_relative 'test-helper'

require_relative '../lib/rgb'

class RgbTest < Minitest::Test
  def test_to_hex
    assert_equal '#000000', to_hex(0, 0, 0)
    assert_equal '#ffffff', to_hex(255, 255, 255)
    assert_equal '#043c78', to_hex(4, 60, 120)
  end

  def test_to_ints
    assert_equal [0, 0, 0], to_ints('#000000')
    assert_equal [255, 255, 255], to_ints('#ffffff')
    assert_equal [4, 60, 120], to_ints('#043c78')

    # 以下は異常系
    assert_nil to_ints(nil)
    assert_nil to_ints('000000')
    assert_nil to_ints('#043c7')
  end

  def test_seika_regexp
    assert "A\u{17000}B".match(/\p{Tangut}/)
  end
end
