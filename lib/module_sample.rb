module M
  def instance_method_a; puts "Called M!"; end
end

class KlassI
  include M
  def instance_method_a; puts "Called I!"; end
end
class KlassP
  prepend M
  def instance_method_a; puts "Called P!"; end
end
class KlassE
  extend M
  def instance_method_a; puts "Called E!"; end
end

puts "=== included? ==="
puts "KlassI: #{KlassI.include?(M)}"  # => true
puts "KlassP: #{KlassP.include?(M)}"  # => true
puts "KlassE: #{KlassE.include?(M)}"  # => false

puts "=== include_modules ==="
puts "KlassI: #{KlassI.included_modules}" # => [M, Kernel]
puts "KlassP: #{KlassP.included_modules}" # => [M, Kernel]
puts "KlassE: #{KlassE.included_modules}" # => [Kernel]

puts "=== ancestors ==="
puts "KlassI: #{KlassI.ancestors}"  # => [KlassI, M, Object, Kernel, BasicObject]
puts "KlassP: #{KlassP.ancestors}"  # => [M, KlassP, Object, Kernel, BasicObject]
puts "KlassE: #{KlassE.ancestors}"  # => [KlassE, Object, Kernel, BasicObject]

puts "=== instance_methods ==="
puts "KlassI: #{KlassI.instance_methods}" # => [:instance_method_a, ...多数]
puts "KlassP: #{KlassP.instance_methods}" # => [:instance_method_a, ...多数]
puts "KlassE: #{KlassE.instance_methods}" # => [ ...多数]


KlassI.new.instance_method_a  # => "Called I!"
KlassP.new.instance_method_a  # => "Called M!"

puts "=== singleton_methods ==="
puts "KlassI: #{KlassI.singleton_methods}"  # => []
puts "KlassP: #{KlassP.singleton_methods}"  # => []
puts "KlassE: #{KlassE.singleton_methods}"  # => [:instance_method_a]

puts "=== extended to a class ==="
KlassE.instance_method_a      # => "Called M!"
KlassE.new.instance_method_a  # => "Called E!"

puts "=== extend to a instance ==="
obj = Object.new
obj.extend M
p obj.singleton_methods   # => [:instance_method_a]
obj.instance_method_a     # => "Called M!"
