def flip_flop(text)
  output_flag = false
  text.each_line(chomp: true).inject(+"") do |output, line|
    if line == 'いただきます'
      output_flag = true
    end

    if output_flag
      output.concat("#{line}\n")
    end

    if line == 'ごちそうさま'
      output_flag = false
    end
    output
  end
end

text = <<~TEXT
  おはようございます
  いただきます
  カレーを食べる
  スープを飲む
  デザートを食べる
  ごちそうさま
  ひるねをする
  しごとをする
  いただきます
  ピザを食べる
  ケーキを食べる
  コーヒーを飲む
  ごちそうさま
  おやすみなさい
TEXT

if $0 == __FILE__
  puts flip_flop(text)
end