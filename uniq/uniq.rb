module Enumerable
  def uniq
    ret = []
    checkers = []
    self.each do |n|
      checker = block_given? ? yield(n) : n
      unless checkers.include?(checker)
        ret << n
        checkers << checker
      end
    end
    ret
  end
end

# Arrayにもuniqを定義
Array.class_eval{ define_method(:uniq, Enumerable.instance_method(:uniq)) }
