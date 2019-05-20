module Enumerable
    def sum(a = 0)
        self.each do |v|
            a += block_given? ? yield(v) : v
        end
        return a
    end
end