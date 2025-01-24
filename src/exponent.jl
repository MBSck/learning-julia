function exponent(order::Int, x::Float64)
  fac = order <= 21 ? x -> factorial(x) : x -> factorial(big(x))
  sum(map(i -> x^i / fac(i), 0:order))
end

e = exponent(100, 1.0)
println(log(2))
println(exponent(100, log(1000) * 0.5))
