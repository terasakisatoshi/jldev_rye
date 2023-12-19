# JLRye [![JuliaCI](https://github.com/terasakisatoshi/jldev_rye/actions/workflows/JuliaCI.yml/badge.svg)](https://github.com/terasakisatoshi/jldev_rye/actions/workflows/JuliaCI.yml) [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://terasakisatoshi.github.io/JLRye.jl/stable/) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://terasakisatoshi.github.io/JLRye.jl/dev/)
[![Rye](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/mitsuhiko/rye/main/artwork/badge.json)](https://rye-up.com)

## How to use

## Prerequisites

- Install Julia
  - It is a good idea to use [juliaup](https://github.com/JuliaLang/juliaup).
- Install `rye`
  - Please follow [the instructions](https://rye-up.com/guide/installation/).


Here is an output from my machine

```console
$ julia --version
julia version 1.9.4
$ rye --version
rye 0.16.0
commit: 0.16.0 (c003223d5 2023-12-16)
platform: macos (x86_64)
self-python: cpython@3.11
symlink support: true
```

## Setup this project

```console
$ git clone git@github.com:terasakisatoshi/jldev_rye.git
$ cd jldev_rye
$ rye sync
$ julia --project -e 'using Pkg; Pkg.instantiate()'
```

That's it. Go on to the next section.

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

If you are a Pythonista, you may want to run the following script:

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
