value = [1, 2, 3]

# データ型で分岐
case value
  # 内部的には String === value が実行されている
  when String
    puts '文字列'
  when Array
    puts "配列"
  when Hash
    puts 'ハッシュ'
end