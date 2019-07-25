using Test, MPStates

@testset "Operations with Mps" begin
@testset "measure occupation at one site" begin
    rtest1 = MPStates.init_test_mps("rtest1")
    @test expected(rtest1, "n", 1) ≈ 1/9
    @test expected(rtest1, "n", 2) ≈ 4/9
    @test expected(rtest1, "n", 3) ≈ 4/9
    @test expected(rtest1, "n", 4) ≈ 1.
    @test expected(rtest1, "n", 5) ≈ 0.64
    @test expected(rtest1, "n", 6) ≈ 1.
    ctest1 = MPStates.init_test_mps("ctest1")
    @test expected(ctest1, "n", 1) ≈ 1/9
    @test expected(ctest1, "n", 2) ≈ 4/9
    @test expected(ctest1, "n", 3) ≈ 4/9
    @test expected(ctest1, "n", 4) ≈ 1.
    @test expected(ctest1, "n", 5) ≈ 0.64
    @test expected(ctest1, "n", 6) ≈ 1.
    rtest2 = MPStates.init_test_mps("rtest2")
    @test expected(rtest2, "n", 1) ≈ 5/9
    @test expected(rtest2, "n", 2) ≈ 5/9
    @test expected(rtest2, "n", 3) ≈ 1.
    @test expected(rtest2, "n", 4) ≈ 1.
    @test expected(rtest2, "n", 5) ≈ 1.
    @test expected(rtest2, "n", 6) ≈ 0.64
    ctest2 = MPStates.init_test_mps("ctest2")
    @test expected(ctest2, "n", 1) ≈ 5/9
    @test expected(ctest2, "n", 2) ≈ 5/9
    @test expected(ctest2, "n", 3) ≈ 1.
    @test expected(ctest2, "n", 4) ≈ 1.
    @test expected(ctest2, "n", 5) ≈ 1.
    @test expected(ctest2, "n", 6) ≈ 0.64
end

@testset "measure fermionic correlations" begin
    rtest1 = MPStates.init_test_mps("rtest1")
    @test expected(rtest1, "c+", 1, "c", 2, ferm_op="Z") ≈ -2/9
    @test expected(rtest1, "c+", 1, "c", 4, ferm_op="Z") ≈ 0. atol=1e-15
    @test expected(rtest1, "c+", 3, "c", 2, ferm_op="Z") ≈ -4/9
    @test expected(rtest1, "c+", 2, "c", 6, ferm_op="Z") ≈ 0. atol=1e-15
    @test expected(rtest1, "c+", 6, "c", 1, ferm_op="Z") ≈ 0.  atol=1e-15
    ctest1 = MPStates.init_test_mps("ctest1")
    @test expected(ctest1, "c+", 1, "c", 2, ferm_op="Z") ≈ complex(0., 2/9)
    @test expected(ctest1, "c+", 1, "c", 4, ferm_op="Z") ≈ 0. atol=1e-15
    @test expected(ctest1, "c+", 3, "c", 2, ferm_op="Z") ≈ complex(0., 4/9)
    @test expected(ctest1, "c+", 2, "c", 6, ferm_op="Z") ≈ 0. atol=1e-15
    @test expected(ctest1, "c+", 6, "c", 1, ferm_op="Z") ≈ 0.  atol=1e-15
    rtest2 = MPStates.init_test_mps("rtest2")
    @test expected(rtest2, "c+", 1, "c", 2, ferm_op="Z") ≈ -4/9
    @test expected(rtest2, "c+", 1, "c", 4, ferm_op="Z") ≈ 0. atol=1e-15
    @test expected(rtest2, "c+", 2, "c", 6, ferm_op="Z") ≈ 2/9*0.6*0.8
    @test expected(rtest2, "c+", 6, "c", 1, ferm_op="Z") ≈ 2/9*0.6*0.8
    ctest2 = MPStates.init_test_mps("ctest2")
    @test expected(ctest2, "c+", 1, "c", 2, ferm_op="Z") ≈ complex(0., -4/9)
    @test expected(ctest2, "c+", 1, "c", 4, ferm_op="Z") ≈ 0. atol=1e-15
    @test expected(ctest2, "c+", 2, "c", 6, ferm_op="Z") ≈ 2/9*0.6*0.8
    @test expected(ctest2, "c+", 6, "c", 1, ferm_op="Z") ≈ complex(0., -2/9*0.6*0.8)
end

@testset "measure correlations" begin
    rtest1 = MPStates.init_test_mps("rtest1")
    @test expected(rtest1, "b+", 1, "b", 2) ≈ -2/9
    @test expected(rtest1, "b+", 1, "b", 4) ≈ 0. atol=1e-15
    @test expected(rtest1, "b+", 3, "b", 2) ≈ -4/9
    @test expected(rtest1, "b+", 2, "b", 6) ≈ 0. atol=1e-15
    @test expected(rtest1, "b+", 6, "b", 1) ≈ 0.  atol=1e-15
    ctest1 = MPStates.init_test_mps("ctest1")
    @test expected(ctest1, "b+", 1, "b", 2) ≈ complex(0., 2/9)
    @test expected(ctest1, "b+", 1, "b", 4) ≈ 0. atol=1e-15
    @test expected(ctest1, "b+", 3, "b", 2) ≈ complex(0., 4/9)
    @test expected(ctest1, "b+", 2, "b", 6) ≈ 0. atol=1e-15
    @test expected(ctest1, "b+", 6, "b", 1) ≈ 0.  atol=1e-15
    rtest2 = MPStates.init_test_mps("rtest2")
    @test expected(rtest2, "b+", 1, "b", 2) ≈ -4/9
    @test expected(rtest2, "b+", 1, "b", 4) ≈ 0. atol=1e-15
    @test expected(rtest2, "b+", 2, "b", 6) ≈ -2/9*0.6*0.8
    @test expected(rtest2, "b+", 6, "b", 1) ≈ 2/9*0.6*0.8
    ctest2 = MPStates.init_test_mps("ctest2")
    @test expected(ctest2, "b+", 1, "b", 2) ≈ complex(0., -4/9)
    @test expected(ctest2, "b+", 1, "b", 4) ≈ 0. atol=1e-15
    @test expected(ctest2, "b+", 2, "b", 6) ≈ -2/9*0.6*0.8
    @test expected(ctest2, "b+", 6, "b", 1) ≈ complex(0., -2/9*0.6*0.8)
end

@testset "measure 2 point occupations" begin
    rtest1 = MPStates.init_test_mps("rtest1")
    @test expected(rtest1, "n", 1, "n", 2) ≈ 0. atol=1e-15
    @test expected(rtest1, "n", 1, "n", 4) ≈ 1/9
    @test expected(rtest1, "n", 3, "n", 2) ≈ 0. atol=1e-15
    @test expected(rtest1, "n", 2, "n", 5) ≈ 4/9*0.64
    @test expected(rtest1, "n", 6, "n", 1) ≈ 1/9
    ctest1 = MPStates.init_test_mps("ctest1")
    @test expected(ctest1, "n", 1, "n", 2) ≈ 0. atol=1e-15
    @test expected(ctest1, "n", 1, "n", 4) ≈ 1/9
    @test expected(ctest1, "n", 3, "n", 2) ≈ 0. atol=1e-15
    @test expected(ctest1, "n", 2, "n", 5) ≈ 4/9*0.64
    @test expected(ctest1, "n", 6, "n", 1) ≈ 1/9
    rtest2 = MPStates.init_test_mps("rtest2")
    @test expected(rtest2, "n", 1, "n", 2) ≈ 1/9
    @test expected(rtest2, "n", 1, "n", 4) ≈ 5/9
    @test expected(rtest2, "n", 2, "n", 6) ≈ 5/9*0.64
    @test expected(rtest2, "n", 6, "n", 1) ≈ 5/9*0.64
    ctest2 = MPStates.init_test_mps("ctest2")
    @test expected(ctest2, "n", 1, "n", 2) ≈ 1/9
    @test expected(ctest2, "n", 1, "n", 4) ≈ 5/9
    @test expected(ctest2, "n", 2, "n", 6) ≈ 5/9*0.64
    @test expected(ctest2, "n", 6, "n", 1) ≈ 5/9*0.64

end

@testset "contraction of two MPS" begin
    L = 6
    GHZ = init_mps(Float64, L, "GHZ")
    W = init_mps(Float64, L, "W")
    full = init_mps(Float64, L, "full")
    product = init_mps(Float64, L, "product")
    cGHZ = init_mps(ComplexF64, L, "GHZ")
    cW = init_mps(ComplexF64, L, "W")
    cfull = init_mps(ComplexF64, L, "full")
    cproduct = init_mps(ComplexF64, L, "product")
    @test contract(GHZ, W) ≈ 0. atol=1e-15
    @test contract(GHZ, full) ≈ 1/sqrt(2^(L-1))
    @test contract(GHZ, product) ≈ 1/sqrt(2)
    @test contract(W, full) ≈ sqrt(L/2^L)
    @test contract(W, product) ≈ 0. atol=1e-15
    @test contract(full, product) ≈ 1/sqrt(2^L)
    rtest1 = MPStates.init_test_mps("rtest1")
    @test contract(rtest1, W) ≈ 0. atol=1e-15
    @test contract(rtest1, GHZ) ≈ 0. atol=1e-15
    @test contract(rtest1, full) ≈ (1/3 - 2/3 + 2/3)*(-0.6 + 0.8)/sqrt(2^L)
    ctest1 = MPStates.init_test_mps("ctest1")
    @test contract(ctest1, cW) ≈ 0. atol=1e-15
    @test contract(ctest1, cGHZ) ≈ 0. atol=1e-15
    @test contract(ctest1, cfull) ≈ (-1im/3 - 2im/3 - 2/3)*(0.6im + 0.8)/sqrt(2^L)
    @test contract(cfull, ctest1) ≈ (1im/3 + 2im/3 - 2/3)*(-0.6im + 0.8)/sqrt(2^L)
    rtest2 = MPStates.init_test_mps("rtest2")
    @test contract(rtest2, W) ≈ 0. atol=1e-15
    @test contract(rtest2, GHZ) ≈ 0.8*1/3/sqrt(2)
    @test contract(rtest2, full) ≈ (1/3 - 2/3 + 2/3)*(0.6 + 0.8)/sqrt(2^L)
    ctest2 = MPStates.init_test_mps("ctest2")
    @test contract(ctest2, cW) ≈ 0. atol=1e-15
    @test contract(ctest2, cGHZ) ≈ -0.8*1/3/sqrt(2)
    @test contract(cGHZ, ctest2) ≈ -0.8*1/3/sqrt(2)
    @test contract(ctest2, cfull) ≈ (-1im/3 - 2/3 - 2im/3)*(0.6 - 0.8im)/sqrt(2^L)
    @test contract(cfull, ctest2) ≈ (1im/3 - 2/3 + 2im/3)*(0.6 + 0.8im)/sqrt(2^L)
end

@testset "norm of a MPS" begin
    L = 6
    GHZ = init_mps(Float64, L, "GHZ")
    W = init_mps(Float64, L, "W")
    full = init_mps(Float64, L, "full")
    product = init_mps(Float64, L, "product")
    @test norm(GHZ) ≈ 1.
    @test norm(full) ≈ 1.
    @test norm(product) ≈ 1.
    @test norm(W) ≈ 1.
    rtest1 = MPStates.init_test_mps("rtest1")
    ctest1 = MPStates.init_test_mps("ctest1")
    rtest2 = MPStates.init_test_mps("rtest2")
    ctest2 = MPStates.init_test_mps("ctest2")
    @test norm(rtest1) ≈ 1.
    @test norm(rtest2) ≈ 1.
    @test norm(ctest1) ≈ 1.
    @test norm(ctest2) ≈ 1.
end

@testset "schmidt decomposition" begin
    L = 4
    GHZ = init_mps(Float64, L, "GHZ")
    @test MPStates.schmidt_decomp(GHZ, 1) ≈ [1/sqrt(2), 1/sqrt(2)]
    @test MPStates.schmidt_decomp(GHZ, 2) ≈ [1/sqrt(2), 1/sqrt(2)]
    W = init_mps(Float64, L, "W")
    @test MPStates.schmidt_decomp(W, 1) ≈ [sqrt(3)/2, 0.5]
    @test MPStates.schmidt_decomp(W, 2) ≈ [1/sqrt(2), 1/sqrt(2)]
    rtest1 = MPStates.init_test_mps("rtest1")
    @test MPStates.schmidt_decomp(rtest1, 1) ≈ [2sqrt(2)/3, 1/3]
    @test MPStates.schmidt_decomp(rtest1, 2) ≈ [sqrt(5)/3, 2/3]
    @test MPStates.schmidt_decomp(rtest1, 3) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(rtest1, 4) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(rtest1, 5) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(rtest1, 6) ≈ [1.]
    ctest1 = MPStates.init_test_mps("ctest1")
    @test MPStates.schmidt_decomp(ctest1, 1) ≈ [2sqrt(2)/3, 1/3]
    @test MPStates.schmidt_decomp(ctest1, 2) ≈ [sqrt(5)/3, 2/3]
    @test MPStates.schmidt_decomp(ctest1, 3) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(ctest1, 4) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(ctest1, 5) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(ctest1, 6) ≈ [1.]
    rtest2 = MPStates.init_test_mps("rtest2")
    @test MPStates.schmidt_decomp(rtest2, 1) ≈ [sqrt((1+sqrt(17)/9)/2), sqrt((1-sqrt(17)/9)/2)]
    @test MPStates.schmidt_decomp(rtest2, 2) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(rtest2, 3) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(rtest2, 4) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(rtest2, 5) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(rtest2, 6) ≈ [1.]
    ctest2 = MPStates.init_test_mps("ctest2")
    @test MPStates.schmidt_decomp(ctest2, 1) ≈ [sqrt((1+sqrt(17)/9)/2), sqrt((1-sqrt(17)/9)/2)]
    @test MPStates.schmidt_decomp(ctest2, 2) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(ctest2, 3) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(ctest2, 4) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(ctest2, 5) ≈ [1., 0.]
    @test MPStates.schmidt_decomp(ctest2, 6) ≈ [1.]
end

@testset "entanglement entropy" begin
    L = 4
    GHZ = init_mps(Float64, L, "GHZ")
    @test ent_entropy(GHZ, 1) ≈ 1/sqrt(2)
    @test ent_entropy(GHZ, 2) ≈ 1/sqrt(2)
    W = init_mps(Float64, L, "W")
    @test ent_entropy(W, 1) ≈ 0.5 - sqrt(3)/2*log2(sqrt(3)/2)
    @test ent_entropy(W, 2) ≈ 1/sqrt(2)
    rtest1 = MPStates.init_test_mps("rtest1")
    @test ent_entropy(rtest1, 1) ≈ -2sqrt(2)/3*log2(2sqrt(2)/3) - 1/3*log2(1/3)
    @test ent_entropy(rtest1, 2) ≈ -sqrt(5)/3*log2(sqrt(5)/3) - 2/3*log2(2/3)
    @test ent_entropy(rtest1, 3) ≈ 0. atol=1e-15
    @test ent_entropy(rtest1, 4) ≈ 0. atol=1e-15
    ctest1 = MPStates.init_test_mps("ctest1")
    @test ent_entropy(ctest1, 1) ≈ -2sqrt(2)/3*log2(2sqrt(2)/3) - 1/3*log2(1/3)
    @test ent_entropy(ctest1, 2) ≈ -sqrt(5)/3*log2(sqrt(5)/3) - 2/3*log2(2/3)
    @test ent_entropy(ctest1, 3) ≈ 0. atol=1e-15
    @test ent_entropy(ctest1, 4) ≈ 0. atol=1e-15
    rtest2 = MPStates.init_test_mps("rtest2")
    @test ent_entropy(rtest2, 1) ≈ -sqrt((1+sqrt(17)/9)/2)*log2(sqrt((1+sqrt(17)/9)/2))-sqrt((1-sqrt(17)/9)/2)*log2(sqrt((1-sqrt(17)/9)/2))
    @test ent_entropy(rtest2, 2) ≈ 0. atol=1e-15
    @test ent_entropy(rtest2, 3) ≈ 0. atol=1e-15
    @test ent_entropy(rtest2, 4) ≈ 0. atol=1e-15
    ctest2 = MPStates.init_test_mps("ctest2")
    @test ent_entropy(ctest2, 1) ≈ -sqrt((1+sqrt(17)/9)/2)*log2(sqrt((1+sqrt(17)/9)/2))-sqrt((1-sqrt(17)/9)/2)*log2(sqrt((1-sqrt(17)/9)/2))
    @test ent_entropy(ctest2, 2) ≈ 0. atol=1e-15
    @test ent_entropy(ctest2, 3) ≈ 0. atol=1e-15
    @test ent_entropy(ctest2, 4) ≈ 0. atol=1e-15
end

@testset "enlargement of bond dimension of MPS" begin
    L = 10
    GHZ = init_mps(Float64, L, "GHZ")
    enlarge_bond_dimension!(GHZ, 5)
    @test size(GHZ.M[1], 1) == 1
    @test size(GHZ.M[1], 3) == 2
    @test size(GHZ.M[3], 1) == 4
    @test size(GHZ.M[3], 3) == 5
    for i=4:7
        @test size(GHZ.M[i], 1) == 5
        @test size(GHZ.M[i], 3) == 5
    end
    @test size(GHZ.M[8], 1) == 5
    @test size(GHZ.M[8], 3) == 4
    @test size(GHZ.M[L], 1) == 2
    @test size(GHZ.M[L], 3) == 1
    # Check that the properties of the Mps are left intact.
    full = init_mps(Float64, L, "full")
    @test contract(GHZ, full) ≈ 1/sqrt(2^(L-1))
    enlarge_bond_dimension!(full, 11)
    @test contract(GHZ, full) ≈ 1/sqrt(2^(L-1))
end

@testset "SVD truncation of MPS" begin
    rtest1 = MPStates.init_test_mps("rtest1")
    svd_truncate!(rtest1, 1)
    @test expected(rtest1, "n", 1) ≈ 0.  atol=1e-15
    @test (expected(rtest1, "n", 2)^2 + expected(rtest1, "n", 3)^2) ≈ 1.
    @test expected(rtest1, "n", 4) ≈ 1.
    @test expected(rtest1, "n", 5) ≈ 0.64
    @test expected(rtest1, "n", 6) ≈ 1.
    ctest1 = MPStates.init_test_mps("ctest1")
    svd_truncate!(ctest1, 1)
    @test expected(ctest1, "n", 1) ≈ 0.  atol=1e-15
    @test (expected(ctest1, "n", 2)^2 + expected(ctest1, "n", 3)^2) ≈ 1.
    @test expected(ctest1, "n", 4) ≈ 1.
    @test expected(ctest1, "n", 5) ≈ 0.64
    @test expected(ctest1, "n", 6) ≈ 1.
    rtest2 = MPStates.init_test_mps("rtest2")
    svd_truncate!(rtest2, 1)
    @test expected(rtest2, "n", 1) ≈ (0.7882054380161092)^2
    @test expected(rtest2, "n", 2) ≈ (0.7882054380161092)^2
    @test expected(rtest2, "n", 3) ≈ 1.
    @test expected(rtest2, "n", 4) ≈ 1.
    @test expected(rtest2, "n", 5) ≈ 1.
    @test expected(rtest2, "n", 6) ≈ 0.64
    ctest2 = MPStates.init_test_mps("ctest2")
    svd_truncate!(ctest2, 1)
    @test expected(ctest2, "n", 1) ≈ (0.7882054380161092)^2
    @test expected(ctest2, "n", 2) ≈ (0.7882054380161092)^2
    @test expected(ctest2, "n", 3) ≈ 1.
    @test expected(ctest2, "n", 4) ≈ 1.
    @test expected(ctest2, "n", 5) ≈ 1.
    @test expected(ctest2, "n", 6) ≈ 0.64
end

@testset "save and read Mps in hdf5 format" for T in [Float64, ComplexF64]
    L = 10
    GHZ = init_mps(T, L, "GHZ")

    filename = "foo.h5"
    # Remove file if previous test crashed and file was not removed.
    isfile(filename) && rm(filename)

    save_mps(filename, GHZ)
    # Read Mps.
    psi = read_mps(filename)
    @test psi.L == L
    @test psi.d == 2
    @test eltype(psi.M[1]) == T
    for i=1:L
        @test psi.M[i] ≈ GHZ.M[i]
    end
    # Remove hdf5 testing file.
    isfile(filename) && rm(filename)
end
end # @testset "Operations with Mps"
