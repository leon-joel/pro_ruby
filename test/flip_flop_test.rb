require 'minitest/autorun'
require_relative 'test-helper'
require_relative '../lib/flip_flop_sample'

class FlipFlopTest < Minitest::Test
  def setup
    @text = <<~TEXT
      おはようございます
      いただきます
      カレーを食べる
      スープを飲む
      デザートを食べる
      ごちそうさま
      ひるねをする
      しごとをする
      いただきます
      ピザを食べる
      ケーキを食べる
      コーヒーを飲む
      ごちそうさま
      おやすみなさい
    TEXT
    @expect = <<~TEXT
      いただきます
      カレーを食べる
      スープを飲む
      デザートを食べる
      ごちそうさま
      いただきます
      ピザを食べる
      ケーキを食べる
      コーヒーを飲む
      ごちそうさま
    TEXT
  end
  def test_flip_flop
    assert_equal @expect, flip_flop(@text)
  end
end