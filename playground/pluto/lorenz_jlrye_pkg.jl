### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ 7ca7410e-9f02-11ee-1578-c79c3630b678
begin
	using Pkg
	Pkg.activate(Base.active_project())
	nothing
end

# ╔═╡ 1dd4c718-9a46-4cdf-b67b-f33b23e0d6a7
begin
	using Plots
	using PythonCall
	using DataFrames
	
	using JLRye # Our local package
end

# ╔═╡ 5e87c2e5-bab1-4577-9a46-eaf720e86c65
md"""

Please init Pluto Notebook via 

```
$ cd playground/pluto
$ julia --project -e 'using Pluto; Pluto.run()'
```

"""

# ╔═╡ 7e6b3b84-ead3-47d8-acfe-49d5968c223e
let
	# Call `generate_points` defined by local Julia package named `JLRye`
	df = JLRye.generate_points()
	# initialize a 3D plot with 1 empty series
	plt = plot3d(
		1,
	    xlim = (-30, 30),
	    ylim = (-30, 30),
	    zlim = (0, 60),
	    title = "Lorenz Attractor",
	    legend = false,
	    marker = 2,
	)
	# build an animated gif by pushing new points to the plot, saving every 10th frame
	# equivalently, you can use `@gif` to replace `@animate` and thus no need to explicitly call `gif(anim)`.
	anim = @animate for i in eachindex(df.x, df.y, df.z)
	    push!(plt, df.x[i], df.y[i], df.z[i])
	end every 10
	gif(anim)
end

# ╔═╡ 594dbac0-64ab-49d4-b0a7-af92333af56b
let
	# Call `generate_points` defined by local Julia package named `JLRye`
	pydf = JLRye.jlrye.generate_points()
	# convert Pandas format to Julia's DataFrames
	df = DataFrame(PythonCall.PyTable(pydf))
	# initialize a 3D plot with 1 empty series
	plt = plot3d(
		1,
	    xlim = (-30, 30),
	    ylim = (-30, 30),
	    zlim = (0, 60),
	    title = "Lorenz Attractor Python -> Julia",
	    legend = false,
	    marker = 2,
	)
	# build an animated gif by pushing new points to the plot, saving every 10th frame
	# equivalently, you can use `@gif` to replace `@animate` and thus no need to explicitly call `gif(anim)`.
	anim = @animate for i in eachindex(df.x, df.y, df.z)
	    push!(plt, df.x[i], df.y[i], df.z[i])
	end every 10
	gif(anim)
end

# ╔═╡ Cell order:
# ╟─5e87c2e5-bab1-4577-9a46-eaf720e86c65
# ╠═7ca7410e-9f02-11ee-1578-c79c3630b678
# ╠═1dd4c718-9a46-4cdf-b67b-f33b23e0d6a7
# ╠═7e6b3b84-ead3-47d8-acfe-49d5968c223e
# ╠═594dbac0-64ab-49d4-b0a7-af92333af56b
