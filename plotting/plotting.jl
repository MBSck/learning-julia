using Plots

x = range(0, 10, length=100)
y = sin.(x)

# println(x)
# println(y)
plot(x, y)
