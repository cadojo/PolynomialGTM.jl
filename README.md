[![Tests](https://github.com/cadojo/PolynomialGTM.jl/workflows/Tests/badge.svg)](https://github.com/cadojo/PolynomialGTM.jl/actions?query=workflow%3ATests)
[![Docs](https://github.com/cadojo/PolynomialGTM.jl/workflows/Documentation/badge.svg)](https://cadojo.github.io/PolynomialGTM.jl/dev)


# PolynomialGTM.jl
_An unofficial implementation of publicly available approximated polynomial models for NASA's Generic Transport Model aircraft._

## Overview

NASA Langley has developed a scaled-down radio-controlled aircraft called the Generic Transport Model (GTM). 
This model is physically similar to a typical commercial plane (think 737, etc.), and is used 
for off-nominal flight control research. [Chakraborty et al](https://www.sciencedirect.com/science/article/abs/pii/S0967066110002595)
published a polynomial approximation for longitudinal GTM dynamics (near select flight conditions). Joe Carpinelli (me!)
wrote these dynamics in Python, and [replicated and summarized](https://github.com/cadojo/Replicated-ROA-Analysis)
parts of Chakraborty et al's region of attraction analysis
for the polynomial-approximated GTM dynamics. 

This Julia package extends [ModelingToolkit.jl](https://github.com/SciML/ModelingToolkit.jl) to provide this 
polynomial-approximated model of longitudinal GTM flight dynamics to the Julia ecosystem! 

## Usage

See the [ModelingToolkit documentation](http://mtk.sciml.ai/stable/) for more usage!

#### Installation and Startup
```julia
julia> ]install PolynomialGTM
julia> using PolynomialGTM
```

#### Vector Field (derivative of state vector)
```julia
julia> f = eval(generate_function(GTM)[1]) # use [2] for the in-place function
```

#### Jacobian 
```julia
julia> J = eval(generate_jacobian(GTM)[1]) # use [2] for the in-place function
```

