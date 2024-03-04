import pandas as pd
import juliacall

jl = juliacall.newmodule("newmodule")
jl.seval("using JLRye")

JLRye = jl.JLRye


def jl_generate_points() -> pd.DataFrame:
    jldf = JLRye.generate_points()
    pydf = juliacall.PythonCall.pytable(jldf)
    return pydf
