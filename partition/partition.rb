module Enumerable
    def partition
        t = []
        f = []
        self.each do |v|
            if yield(v) then
                t.push(v)
            else
                f.push(v)
            end
        end
        return t, f
    end
end