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

class Array
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
