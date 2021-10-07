# PolynomialGTM.jl
_Longitudinal flight dynamics, approximated with polynomials!_

## Overview

This is an unofficial implementation of publicly available approximated polynomial models 
for NASA's Generic Transport Model aircraft. NASA Langley has developed a scaled-down 
radio-controlled aircraft called the Generic Transport Model (GTM). This model is physically 
similar to a typical commercial plane (think 737, etc.), and is used for off-nominal 
flight control research. [Chakraborty et al](https://www.sciencedirect.com/science/article/abs/pii/S0967066110002595)
published a polynomial approximation for longitudinal GTM dynamics (near select flight conditions). Joe Carpinelli (me!)
wrote these dynamics in Python, and [replicated and summarized](https://github.com/cadojo/Replicated-ROA-Analysis)
parts of Chakraborty et al's region of attraction analysis
for the polynomial-approximated GTM dynamics. 

This Julia package extends [ModelingToolkit.jl](https://github.com/SciML/ModelingToolkit.jl) to provide this 
polynomial-approximated model of longitudinal GTM flight dynamics to the Julia ecosystem! 

## Usage

This package exports two functions: `GTM`, and `GTMFunction`. The former constructs an `ODESystem`, 
and the latter returns an `ODEFunction` associated with the model produced by `GTM`. Both functions 
cache all outputs using `Memoize.jl`. 

Some `PolynomialGTM`-specific documentation can be found here, and in the [docstrings](docstrings.md). 
See the [ModelingToolkit documentation](http://mtk.sciml.ai/stable/) for more usage examples!

### Installation and Startup

You can install this package from Julia's [General](https://juliahub.com) package registry
with `import Pkg; Pkg.install("PolynomialGTM")`, or with `julia> ]install PolynomialGTM` in
Julia's REPL. 

```@repl main
using PolynomialGTM
```

### Constructing the Model

Generally, you'll just want to call `GTM` with no arguments.

```@repl main
model = GTM()
```

If you'd like to append state transition matrix dynamics, use `stm=true`.
This appends state transition matrix dynamics to the model's equations 
of motion.

```@repl main
model = GTM(; stm=true)
```

### Constructing the Vector Field

As before, you can optionally append state transition matrix dynamics 
using `stm=true`. 

```@repl main
f = GTMFunction() # or, with `stm=true`
let u = randn(4), p = randn(2), t = rand()
    f(u,p,t)
end
```