#=
Lorenz-Attractor
https://docs.juliaplots.org/latest/user_gallery/misc/gr_lorenz_attractor/#Lorenz-Attractor
=#

# define the Lorenz attractor
Base.@kwdef mutable struct Lorenz
    dt::Float64 = 0.02
    σ::Float64 = 10
    ρ::Float64 = 28
    β::Float64 = 8 / 3
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1
end

function step!(l::Lorenz)
    dx = l.σ * (l.y - l.x)
    dy = l.x * (l.ρ - l.z) - l.y
    dz = l.x * l.y - l.β * l.z
    l.x += l.dt * dx
    l.y += l.dt * dy
    l.z += l.dt * dz
    return nothing
end

function generate_points()::DataFrame
    attractor = Lorenz()
    df = DataFrame(:x => Float64[], :y => Float64[], :z => Float64[])
    for _ in 1:500
        step!(attractor)
        x = attractor.x
        y = attractor.y
        z = attractor.z
        push!(
            df,
            Dict(:x => x, :y => y, :z => z),
        )
    end
    return df
end
