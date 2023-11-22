function count_sum(l)
    s = 12
    d = Dict()
    ans = []
    for i in l
        if haskey(d, Int(abs(s - i)))
            push!(ans, [i, abs(s - i)])
        else
            d[i] = Int(abs(s - i))
        end
    end
    return ans
end




print(count_sum([1,3,8,12,7,11,9,4,2,10,5]))