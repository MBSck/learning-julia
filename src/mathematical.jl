function f(x, y)
  return sqrt(x^2 + y^2)
end


h(x) = begin
  if 0 < x < 3
    return x
  else
    return 0
  end
end


g(x, y) = sqrt(x^2 + y^2)
z(x, y) = h(g(x, y))

println(g(3, 4))
println(z(1, 2))

3 < 4 && println("Hello world!")
true || println("Bye cruel world!")
