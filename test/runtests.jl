module PolynomialGTMTests

using PolynomialGTM, Test

@testset "Constructors" begin

    try
        GTM()
        @test true
    catch e
        @test throw(e)
    end

    try
        GTM(; stm=true)
        @test true
    catch e
        @test throw(e)
    end

end

@testset "Functions" begin

    try
        f = GTMFunction()
        f(randn(4), randn(2), NaN)
        @test true
    catch e
        @test throw(e)
    end

    try
        f = GTMFunction(; stm=true)
        f(randn(20), randn(2), NaN)
        @test true
    catch e
        @test throw(e)
    end

end

@testset "Regression" begin

    f = GTMFunction()
    let u = [0.1, 0.2, 0.3, 0.4], p = [0.1, 0.1], t = NaN
        @test f(u, p, t) ≈ [-1.522331443175375, 0.7478311441572367, 0.14403160747471513, 0.3]
    end

end

end
