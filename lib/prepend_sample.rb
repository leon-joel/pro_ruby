module A
  def to_s
    "<A> #{super}"
  end
end

class Product
  # prependすることで、自分の to_s 実装を module側の to_s 実装に置き換えている。
  # module側の to_s 実装は super を呼び出している（＝Productのto_sが呼び出される）。
  # loggerを差し込んだり、Transactionで囲ったり、というような用途で使える。
  prepend A

  def to_s
    "<Product> #{super}"
  end
end

product = Product.new
puts product.to_s
