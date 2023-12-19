using JLRye: generate_points

@testset "Lorenz" begin
	df = generate_points()
	@test_reference df.x "lorenz_x.txt"
	@test_reference df.y "lorenz_y.txt"
	@test_reference df.z "lorenz_z.txt"
end
