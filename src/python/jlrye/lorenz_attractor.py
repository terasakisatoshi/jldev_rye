"""
Lorenz-Attractor
https://docs.juliaplots.org/latest/user_gallery/misc/gr_lorenz_attractor/#Lorenz-Attractor
"""

import pandas as pd
from pydantic import BaseModel


class Lorenz(BaseModel):
    dt: float = 0.02
    sigma: float = 10
    rho: float = 28
    beta: float = 8 / 3
    x: float = 1
    y: float = 1
    z: float = 1

    def step(self):
        dx = self.sigma * (self.y - self.x)
        dy = self.x * (self.rho - self.z) - self.y
        dz = self.x * self.y - self.beta * self.z
        self.x += self.dt * dx
        self.y += self.dt * dy
        self.z += self.dt * dz


def generate_points():
    attractor = Lorenz()
    xs = []
    ys = []
    zs = []
    for _ in range(500):
        attractor.step()
        x = attractor.x
        y = attractor.y
        z = attractor.z
        xs.append(x)
        ys.append(y)
        zs.append(z)
    df = pd.DataFrame({"x": xs, "y": ys, "z": zs})
    return df
