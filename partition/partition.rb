module Enumerable
  def partition(&block)
    return self.to_enum unless block_given? # 未実装

    fulfilled = []
    not_fulfilled = []

    self.each do |n|
      arr = yield(n) ? fulfilled : not_fulfilled
      arr.push(n)
    end

    [fulfilled, not_fulfilled]
  end
end
