using Documenter
using PolynomialGTM

makedocs(
    sitename = "PolynomialGTM",
    format = Documenter.HTML(),
    modules = [PolynomialGTM],
    pages = [
        "Quick Start" => "index.md",
        "Docstrings" => "docstrings.md"
    ]
)

deploydocs(
    target    = "build",
    repo      = "github.com/cadojo/PolynomialGTM.jl.git",
    branch    = "gh-pages",
    devbranch = "main",
    versions  = ["stable" => "v^", "manual", "v#.#", "v#.#.#"],
)
