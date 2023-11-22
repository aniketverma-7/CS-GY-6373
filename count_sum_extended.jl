function count_sum(l,s)
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


function count_sum_extended(l)
    ans = []
    for i in 1:length(l)
        for j in i+1:length(l)
            push!(ans, [l[i] + l[j], count_sum(l, l[i] + l[j])])
        end
    end
    return ans
end


results = count_sum_extended([1,2,3,4])

for r in results
    println("[$(join(r, ", "))]")
end