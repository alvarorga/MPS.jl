using Test, LinearAlgebra, MPStates

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

@testset "measure fermionic correlations" begin
    L = 4
    full = init_mps(Float64, L, "full")
    @test m_fermionic_correlation(full, 1, 2) ≈ 0.25
    @test m_fermionic_correlation(full, 1, 3) ≈ 0.
    @test m_fermionic_correlation(full, 1, 4) ≈ 0.
end

@testset "measure correlations" begin
    L = 4
    full = init_mps(Float64, L, "full")
    @test m_correlation(full, 1, 2) ≈ 0.25
    @test m_correlation(full, 1, 3) ≈ 0.25
    @test m_correlation(full, 1, 4) ≈ 0.25
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

@testset "schmidt decomposition" begin
    L = 4
    GHZ = init_mps(Float64, L, "GHZ")
    @test MPStates.schmidt_decomp(GHZ, 1) ≈ [1/sqrt(2), 1/sqrt(2)]
    @test MPStates.schmidt_decomp(GHZ, 2) ≈ [1/sqrt(2), 1/sqrt(2)]
    W = init_mps(Float64, L, "W")
    @test MPStates.schmidt_decomp(W, 1) ≈ [sqrt(3)/2, 0.5]
    @test MPStates.schmidt_decomp(W, 2) ≈ [1/sqrt(2), 1/sqrt(2)]
end

@testset "entanglement entropy" begin
    L = 4
    GHZ = init_mps(Float64, L, "GHZ")
    @test ent_entropy(GHZ, 1) ≈ 1/sqrt(2)
    @test ent_entropy(GHZ, 2) ≈ 1/sqrt(2)
    W = init_mps(Float64, L, "W")
    @test ent_entropy(W, 1) ≈ 0.5 - sqrt(3)/2*log2(sqrt(3)/2)
    @test ent_entropy(W, 2) ≈ 1/sqrt(2)
end

@testset "enlargement of bond dimension of MPS" begin
    L = 10
    GHZ = init_mps(Float64, L, "GHZ")
    enlarge_bond_dimension!(GHZ, 5)
    @test size(GHZ.A[1], 1) == 1
    @test size(GHZ.A[1], 3) == 2
    @test size(GHZ.A[3], 1) == 4
    @test size(GHZ.A[3], 3) == 5
    for i=4:7
        @test size(GHZ.A[i], 1) == 5
        @test size(GHZ.A[i], 3) == 5
    end
    @test size(GHZ.A[8], 1) == 5
    @test size(GHZ.A[8], 3) == 4
    @test size(GHZ.A[L], 1) == 2
    @test size(GHZ.A[L], 3) == 1
    # Check that the properties of the Mps are left intact.
    full = init_mps(Float64, L, "full")
    @test contract(GHZ, full) ≈ 1/sqrt(2^(L-1))
    enlarge_bond_dimension!(full, 11)
    @test contract(GHZ, full) ≈ 1/sqrt(2^(L-1))
end

@testset "SVD truncation of MPS" begin
    L = 10
    GHZ = init_mps(Float64, L, "GHZ")
    enlarge_bond_dimension!(GHZ, 5)
    svd_truncate!(GHZ, 3)
    @test size(GHZ.A[1], 1) == 1
    @test size(GHZ.A[1], 3) == 2
    @test size(GHZ.A[2], 1) == 2
    @test size(GHZ.A[2], 3) == 3
    for i=3:8
        @test size(GHZ.A[i], 1) == 3
        @test size(GHZ.A[i], 3) == 3
    end
    @test size(GHZ.A[9], 1) == 3
    @test size(GHZ.A[9], 3) == 2
    @test size(GHZ.A[10], 1) == 2
    @test size(GHZ.A[10], 3) == 1
    # Check that the properties of the Mps are left intact.
    full = init_mps(Float64, L, "full")
    @test contract(GHZ, full) ≈ 1/sqrt(2^(L-1))
end
