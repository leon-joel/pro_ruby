# デフォルト 値 なし の キーワード 引数 を 使っ て メソッド を 定義 する
def buy_burger( menu, drink:, potato:)
  puts "#{menu}: drink=#{drink}, potato=#{potato}"
end
# キーワード 引数 を 指定 すれ ば、 デフォルト 値 あり の 場合 と 同じ よう に 使える
buy_burger('cheese', drink: true, potato: true)

# キーワード 引数 を 省略 する と エラー に なる
# buy_burger(' fish', potato: false) #=> ArgumentError: missing keywords: drink

params = { drink: true, potato: false }
buy_burger('teriyaki', params)