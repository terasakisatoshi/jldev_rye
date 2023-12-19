"""
Lorenz-Attractor
https://docs.juliaplots.org/latest/user_gallery/misc/gr_lorenz_attractor/#Lorenz-Attractor
"""

from pydantic import BaseModel
import pandas as pd


class Lorenz(BaseModel):
    dt: float = 0.02
    sigma: float = 10
    rho: float = 28
    beta: float = 8 / 3
    x: float = 1
    y: float = 1
    z: float = 1

    def step(self):
        dx = self.σ * (self.y - self.x)
        dy = self.x * (self.ρ - self.z) - self.y
        dz = self.x * self.y - self.β * self.z
        self.x += self.dt * dx
        self.y += self.dt * dy
        self.z += self.dt * dz


def generate_points(attractor: Lorenz = Lorenz()):
    df = pd.DataFrame(columns=["x", "y", "z"])
    for _ in range(500):
        attractor.step()
        x = attractor.x
        y = attractor.y
        z = attractor.z
        df.append({"x": x, "y": y, "z": z})
    return df
