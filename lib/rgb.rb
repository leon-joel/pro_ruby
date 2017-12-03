def to_hex(r, g, b)
  [r, g, b].inject("#") do |hex, n|
    hex + "%02x" % n
  end
end

def to_ints(exp)
  # ★何故か文字クラス省略形が正しく認識されない。
  # ➾ 【解決】macの場合 ¥ と \ は違う文字として扱われているらしい。
  # exp.scan(/¥w¥w/).map(&:hex)
  # exp.scan(/[0-9a-f]{2}/).map(&:hex)  # これはOK

  m = exp&.match(/\A#(\h{2})(\h{2})(\h{2})\z/)
  return nil if m.nil?
  m[1..3].map(&:hex)
end

if $0 == __FILE__
  p to_ints("#0123af")
end
