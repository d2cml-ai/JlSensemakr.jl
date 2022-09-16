using JlSensemakr
using Documenter

DocMeta.setdocmeta!(JlSensemakr, :DocTestSetup, :(using JlSensemakr); recursive=true)

makedocs(;
    modules=[JlSensemakr],
    authors="Rodrigo Grijalba, Alexander Quispe",
    repo="https://github.com/d2cml-ai/JlSensemakr.jl/blob/{commit}{path}#{line}",
    sitename="JlSensemakr.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://d2cml-ai.github.io/JlSensemakr.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/d2cml-ai/JlSensemakr.jl",
    devbranch="master",
)
