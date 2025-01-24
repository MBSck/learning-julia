function heron_root(number, epsilon=1e-8)
  x, y = 1, number
  while (x - y) > 0 ? (x - y) >= epsilon : (y - x) >= epsilon
    x = (x + y) / 2
    y = number / x
  end
  return round(x, digits=-Int(log10(epsilon)))
end

println(heron_root(33))
