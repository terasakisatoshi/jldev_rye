### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ 4849638b-bdc3-4d63-be39-290e2c99106e
begin
	using Pkg
	Pkg.activate(Base.active_project())
end

# ╔═╡ 4ec662d6-28c9-4b6a-8b0c-dbe0cd2b1863
using CondaPkg

# ╔═╡ bdfab89a-a72e-4aca-a91d-348f06aea72d
begin
	using DataFrames
	using Plots
	using PythonCall

	using JLRye
end

# ╔═╡ 3f67dfbf-2bb6-42eb-b64e-1e803eab4690
begin
	jlrye_path = pkgdir(JLRye)
	CondaPkg.withenv() do
		pip = CondaPkg.which("pip")
		run(`$pip install $jlrye_path`)
	end
end

# ╔═╡ 3d32d078-e61b-45df-8d1c-1e38c59dc052
jlrye = pyimport("jlrye")

# ╔═╡ a99d6018-6842-403d-a265-8170a9ecc858
let
	pydf = jlrye.generate_points()
	df = DataFrame(PyTable(pydf))
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

# ╔═╡ Cell order:
# ╠═4ec662d6-28c9-4b6a-8b0c-dbe0cd2b1863
# ╠═4849638b-bdc3-4d63-be39-290e2c99106e
# ╠═bdfab89a-a72e-4aca-a91d-348f06aea72d
# ╠═3f67dfbf-2bb6-42eb-b64e-1e803eab4690
# ╠═3d32d078-e61b-45df-8d1c-1e38c59dc052
# ╠═a99d6018-6842-403d-a265-8170a9ecc858
