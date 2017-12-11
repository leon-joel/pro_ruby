module StringShuffle
  refine String do
    def shuffle
      chars.shuffle.join
    end
  end
end

# puts 'Alice'.shuffle   # もちろんshuffleは使えない

class User
  using StringShuffle

  def initialize(name)
    @name = name
  end

  def shuffled_name
    @name.shuffle
  end
end

user = User.new('Alice')
puts user.shuffled_name   # Userクラス内では正しくshuffleされていることが分かる

using StringShuffle
puts 'Alice'.shuffle  # 上でusingしたので、ここでは使えるようになった