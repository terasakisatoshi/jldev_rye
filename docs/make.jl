using Documenter
using JLRye

DocMeta.setdocmeta!(JLRye, :DocTestSetup, :(using JLRye); recursive=true)

makedocs(;
    modules=[JLRye],
    authors="Satoshi Terasaki <terasakisatoshi.math@gmail.com> and contributors",
    sitename="JLRye.jl",
    format=Documenter.HTML(;
        canonical="https://github.com/AtelierArith/PkgBump.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md"
    ],
)

deploydocs(;
    repo="github.com/terasakisatoshi/JLRye.jl",
    devbranch="main",
)
