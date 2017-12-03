def to_hex(r, g, b)
  [r, g, b].inject("#") do |hex, n|
    hex + "%02x" % n
  end
end

def to_ints(hex)
  r, g, b = hex[1..2], hex[3..4], hex[5..6]
  [r, g, b].map(&:hex)
end