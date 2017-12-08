class Product
  attr_reader :code, :name, :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end

  # 演算子のオーバーライド
  def ==(other)
    if other.is_a? Product
      code == other.code
    else
      false
    end
  end
end

class DVD < Product
  # 明示的にname, priceという引数を書く代わりに、*だけで済ませる
  def initialize(*)
    # 渡された引数を全部そのままスーパークラスに渡す
    super

    # サブクラスで必要な初期化処理を書く
  end
end

if $0 == __FILE__
  dvd = DVD.new('A-001', 'A great movie', 1000)
  dvd.name  #=> "A great movie"
  dvd.price #=> 1000
end
