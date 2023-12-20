using JLRye: Lorenz, generate_points
using JLRye: jlrye
using DataFrames
using PythonCall: PyTable

@testset "Lorenz init" begin
    attractor = Lorenz()
    @test attractor.dt == 0.02
    @test attractor.σ == 10
    @test attractor.ρ == 28
    @test attractor.β == 8 / 3
    @test attractor.x == 1
    @test attractor.y == 1
    @test attractor.z == 1
end

@testset "generate_points" begin
    df = generate_points()
    @test size(df) == (1500, 3)
    @test_reference "references/lorenz_x.txt" df.x
    @test_reference "references/lorenz_y.txt" df.y
    @test_reference "references/lorenz_z.txt" df.z
end

@testset "Python.generate_points" begin
    pydf = jlrye.generate_points()
    df = DataFrame(PyTable(pydf))
    @test size(df) == (1500, 3)
    @test_reference "references/lorenz_x.txt" df.x
    @test_reference "references/lorenz_y.txt" df.y
    @test_reference "references/lorenz_z.txt" df.z
end

