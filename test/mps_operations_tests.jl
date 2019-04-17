@testset "measure occupation at one site" begin
    L = 5
    GHZ = init_mps(Float64, L, "GHZ")
    @test m_occupation(GHZ, 1) ≈ 0.5
    @test m_occupation(GHZ, 2) ≈ 0.5
    @test m_occupation(GHZ, 5) ≈ 0.5
    W = init_mps(Float64, L, "W")
    @test m_occupation(W, 1) ≈ 1/L
    @test m_occupation(W, 3) ≈ 1/L
    @test m_occupation(W, 5) ≈ 1/L
end

@testset "contraction of two MPS" begin
    L = 5
    GHZ = init_mps(Float64, L, "GHZ")
    W = init_mps(Float64, L, "W")
    full = init_mps(Float64, L, "full")
    product = init_mps(Float64, L, "product")
    @test contract(GHZ, W) ≈ 0.
    @test contract(GHZ, full) ≈ 1/sqrt(2^(L-1))
    @test contract(GHZ, product) ≈ 1/sqrt(2)
    @test contract(W, full) ≈ sqrt(L/2^L)
    @test contract(W, product) ≈ 0.
    @test contract(full, product) ≈ 1/sqrt(2^L)
end