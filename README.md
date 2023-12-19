# JLRye [![Build Status](https://github.com/terasakisatoshi/JLRye.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/terasakisatoshi/JLRye.jl/actions/workflows/CI.yml?query=branch%3Amain) [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://terasakisatoshi.github.io/JLRye.jl/stable/) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://terasakisatoshi.github.io/JLRye.jl/dev/)
[![Rye](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/mitsuhiko/rye/main/artwork/badge.json)](https://rye-up.com)

## How to use

## Prerequisites

- Install Julia
- Install `rye`

## Plot Lorenz Attractor

### Python

```python
from matplotlib import pyplot as plt
from jlrye.lorenz_attractor import generate_points
df = generate_points()
ax = plt.figure().add_subplot(projection="3d")
ax.plot(df.x, df.y, df.z, markersize=2, marker="o")
ax.set_title("Lorenz Attractor")
plt.show()
```

### Julia

```julia
using StatsPlots
using JLRye

df = JLRye.generate_points()
@df df plot3d(:x, :y, :z, marker=2, legend=false, title="Lorenz Attractor")
```

If you are Pythonista, you may want to run the following script:

```julia
using PythonPlot: pyplot as plt
using JLRye

df = JLRye.generate_points()
ax = plt.figure().add_subplot(projection="3d")
ax.plot(df.x, df.y, df.z, markersize=2, marker="o")
ax.set_title("Lorenz Attractor")
plt.show()
```

## Call Julia functions from Python

```python
from matplotlib import pyplot as plt

from jlrye.julia_interface import JLRye
jldf = JLRye.generate_points()
df = juliacall.PythonCall.pytable(jldf)
ax = plt.figure().add_subplot(projection="3d")
ax.plot(df.x, df.y, df.z, markersize=2, marker="o")
ax.set_title("Lorenz Attractor")
plt.show()
```

## Call Python functions from Julia

```julia
using DataFrames: DataFrame
using PythonCall: PyTable
using StatsPlots

using JLRye: jlrye
pydf = jlrye.generate_points()
df = DataFrame(PyTable(pydf))
@df df plot3d(:x, :y, :z, marker=2, legend=false, title="Lorenz Attractor")
```

## Run Tests

### Python

```console
$ rye sync
$ rye run pytest
```

### Julia

```console
$ julia --project -e 'using Pkg; Pkg.instantiate()'
$ julia --project -e 'using Pkg; Pkg.test()'
```
