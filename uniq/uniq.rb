module Enumerable
  def uniq
    ret = []
    self.each do |n|
      included = ret.map{ |m| block_given? ? yield(m) : m }
      ret << n unless included.include? (block_given? ? yield(n) : n)
    end
    ret
  end
end

# Arrayにもuniqを定義
Array.class_eval{ define_method(:uniq, Enumerable.instance_method(:uniq)) }
