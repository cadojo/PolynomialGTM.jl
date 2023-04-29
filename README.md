[![Tests](https://github.com/cadojo/PolynomialGTM.jl/workflows/UnitTests/badge.svg)](https://github.com/cadojo/PolynomialGTM.jl/actions?query=workflow%3AUnitTests)
[![Docs](https://github.com/cadojo/PolynomialGTM.jl/workflows/Documentation/badge.svg)](https://cadojo.github.io/PolynomialGTM.jl)

# PolynomialGTM.jl

_An unofficial implementation of publicly available approximated polynomial
models for NASA's Generic Transport Model aircraft._

## Overview

NASA Langley has developed a scaled-down radio-controlled aircraft called the
Generic Transport Model (GTM). This model is physically similar to a typical
commercial plane (think 737, etc.), and is used for off-nominal flight control
research.
[Chakraborty et al](https://www.sciencedirect.com/science/article/abs/pii/S0967066110002595)
published a polynomial approximation for longitudinal GTM dynamics (near select
flight conditions). Joe Carpinelli (me!) wrote these dynamics in Python, and
[replicated and summarized](https://github.com/cadojo/Replicated-ROA-Analysis)
parts of Chakraborty et al's region of attraction analysis for the
polynomial-approximated GTM dynamics.

This Julia package extends
[ModelingToolkit.jl](https://github.com/SciML/ModelingToolkit.jl) to provide
this polynomial-approximated model of longitudinal GTM flight dynamics to the
Julia ecosystem!

## Installation

You can install `PolynomialGTM` from Julia's General Registry using `Pkg`, or
`]install PolynomialGTM` in Julia's REPL.

```julia
import Pkg
Pkg.install("PolynomialGTM")
```

## Usage

See the [ModelingToolkit documentation](http://mtk.sciml.ai/stable/) for more
usage examples!

```julia
using PolynomialGTM, ModelingToolkit

# Get the model
model = GTM()

# Get the equations
equations(model)

# Print the equations to LaTeX
using Latexify
latexify(equations(model))

# Get an `ODEFunction` which implements the dynamics
f = GTMFunction()

# Execute the function
let x = randn(4), p = randn(2), t = rand()
  f(x,p,t)
end
```
