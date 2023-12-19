using JLRye
using Documenter

DocMeta.setdocmeta!(JLRye, :DocTestSetup, :(using JLRye); recursive=true)

makedocs(;
    modules=[JLRye],
    authors="Satoshi Terasaki <terasakisatoshi.math@gmail.com> and contributors",
    repo="https://github.com/terasakisatoshi/JLRye.jl/blob/{commit}{path}#{line}",
    sitename="JLRye.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://terasakisatoshi.github.io/JLRye.jl",
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
