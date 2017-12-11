ret = begin
  1/0
  puts 'OK'
  'OK'      # [elseがない場合] 正常終了時はこれが戻り値になる
rescue => e
  puts 'error'
  puts e.message
  'error'   # errorが発生した場合はこれが戻り値になる
else
  puts 'else'
  'else'    # [elseがある場合] 正常終了時はこれが戻り値になる
ensure
  puts 'ensure'
  'ensure'  # ensure節の最後の式は戻り値になることはない
end

puts "ret = #{ret}"


puts
puts "危険な ensure 内 return!!!"

def some_method(n)
  1/n
  'OK'
# rescue
#   'error'
ensure
  # 明示的に return を書くと、常にこれが戻り値になる。
  # ★★★しかも、rescue節がない場合、例外が発生してもその例外が取り消されてしまう！
  return 'ensure'

  # 'ensure'  # returnがない場合は戻り値にならないし、例外が取り消されることもない。
end

puts "ret = #{some_method(1)}"
puts "ret = #{some_method(0)}"
