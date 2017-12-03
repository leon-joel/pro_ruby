def to_hex(r, g, b)
  [r, g, b].inject("#") do |hex, n|
    hex + "%02x" % n
  end
end