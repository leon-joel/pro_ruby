module DeepFreezable
  def deep_freeze(array_or_hash)
    case array_or_hash
    when Array
      array_or_hash.each do |element|
        element.freeze
      end
    when Hash
      array_or_hash.each do |k, v|
        k.freeze
        v.freeze
      end
    end
    array_or_hash.freeze
  end
end
