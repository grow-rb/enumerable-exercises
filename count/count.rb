module Enumerable
    def count(a = nil)
        c = 0
        self.each do |v|
            if block_given? then
                c += 1 if yield(v)
            elsif a != nil && v == a then
                c += 1
            elsif a == nil then
                c += 1
            end
        end
        return c
    end
end

class Array
    def count(a = nil)
        c = 0
        self.each do |v|
            if block_given? then
                c += 1 if yield(v)
            elsif a != nil && v == a then
                c += 1
            elsif a == nil then
                c += 1
            end
        end
        return c
    end
end