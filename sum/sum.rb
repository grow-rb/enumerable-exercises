module Enumerable
  def sum(init = 0)
    ret = init
    self.each { |n| ret += block_given? ? yield(n) : n }
    ret
  end
end