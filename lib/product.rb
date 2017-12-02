class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
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
  dvd = DVD.new('A great movie', 1000)
  dvd.name  #=> "A great movie"
  dvd.price #=> 1000
end
