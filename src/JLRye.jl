module JLRye

# Write your package code here.
using DataFrames: DataFrame
using PythonCall
include("julia/lorenz_attractor.jl")
include("julia/python_interface.jl")

const jlrye = PythonCall.pynew()

function __init__()
    PythonCall.pycopy!(jlrye, pyimport("jlrye"))
end

end
