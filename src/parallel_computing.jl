import Pkg
Pkg.add("BenchmarkTools")
Pkg.add("DistributedArrays")

using Distributed

using BenchmarkTools
using DistributedArrays

d = Dict()

x = rand(10^7)
d["j_bench"] = minimum((@benchmark sum(x)).times) / 1e6

function mysum(x)
  s = 0.0
  for i in x
    s += i
  end
  return s
end

d["my_bench"] = minimum((@benchmark mysum(x)).times) / 1e6

function mysum_fast(x)
  s = 0.0
  for i in x
    @fastmath s += i
  end
  return s
end

d["my_bench_fast"] = minimum((@benchmark mysum_fast(x)).times) / 1e6

addprocs(4)
@everywhere using DistributedArrays

xdist = distribute(x)
d["distributed"] = minimum((@benchmark sum($xdist)).times) / 1e6

# function mysum_dist(a::DArray)
#   r = Array{Future}{undef, length(procs(a))}
#   for (i, id) in enumerate(procs(a))
#     r[i] = @spawnat id sum(localpart(a))
#   end
#   return sum(fetch.(r))
# end


# d["my_distributed"] = minimum((@benchmark mysum_dist($xdist)).times) / 1e6

for (key, value) in d
  println(rpad(key, 25, "."), lpad(round(value; digits=1), 6, "."))
end
