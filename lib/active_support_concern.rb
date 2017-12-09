require 'active_support/concern'

module M
  extend ActiveSupport::Concern

  # ここに定義したメソッドはinstanceメソッドとして取り込まれる
  def m1
  end

  included do
    # attrやscopeはここで。includedで定義したattr,scopeがincludeした側で使えるようになる。
    attr_accessor :hoge
  end

  class_methods do
    # class_methodsに定義したメソッドはclassメソッドとして取り込まれる
    # ※このメソッドをこのモジュールM内から呼び出したい場合にはどうすればいい？？？
    def a_class_method
      puts "a_class_method called."
    end
  end

  # private以下は取り込まれない？？？
  private
  def local_method
    puts "local_method called."
  end
end


class KlassI
  include M

  def pub
    puts "pub"
    local_method
  end
end
puts
puts "=== include_modules ==="
puts "KlassI: #{KlassI.included_modules}" # => [M, Kernel]
puts
puts "=== ancestors ==="
puts "KlassI: #{KlassI.ancestors}"  # => [KlassI, M, Object, Kernel, BasicObject]
puts
puts "=== instance_methods ==="
puts "KlassI: #{KlassI.instance_methods}" # => [:hoge, :pub, :hoge=, :m1, ...多数]
puts
puts "=== singleton_methods ==="
puts "KlassI: #{KlassI.singleton_methods}"  # => [:a_class_method]

puts "=== private_instance_methods ==="
puts "KlassI: #{KlassI.private_instance_methods}" # => [:local_method, ...多数]

# pubを通じて、privateなメソッド local_methodが呼び出される
KlassI.new.pub

# もちろん、モジュールの class_methodsで定義した a_class_methodも呼び出される
KlassI.a_class_method