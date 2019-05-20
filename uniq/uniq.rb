module Enumerable
    def uniq
        u = []
        d = []
        self.each do |v|
            unless d.include?(yield(v))
                d.push(yield(v))
                u.push(v)
            end
        end
        return u
    end
end

class Array
    def uniq
        u = []
        d = []
        self.each do |v|
            if block_given?
                unless d.include?(yield(v))
                    d.push(yield(v))
                    u.push(v)
                end
            else
                u.push(v) unless u.include?(v)
            end
        end
        return u
    end
end