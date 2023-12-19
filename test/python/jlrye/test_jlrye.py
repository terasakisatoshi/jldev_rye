import numpy as np
from jlrye.julia_interface import jl_generate_points
from jlrye.lorenz_attractor import generate_points, Lorenz


def test_Lorenz_attractor():
    attractor = Lorenz()
    assert attractor.dt == 0.02
    assert attractor.sigma == 10
    assert attractor.rho == 28
    assert attractor.beta == 8 / 3
    assert attractor.x == 1
    assert attractor.y == 1
    assert attractor.z == 1

def test_py_generate_points():
    df = generate_points()
    assert df.shape == (500, 3)

def test_jl_generate_points():
    df = jl_generate_points()
    assert df.shape == (500, 3)

def test_generate_points():
    ref = jl_generate_points()
    tar = generate_points()
    assert np.allclose(ref, tar)