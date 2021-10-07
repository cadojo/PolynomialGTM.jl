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

end
