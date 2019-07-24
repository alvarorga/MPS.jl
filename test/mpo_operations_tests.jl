using MPStates, Test

@testset "Operations with Mpo and Mps" begin
@testset "expectation value of Mps" begin
    L = 5
    t = 1.5
    U = 1.5
    H = init_hubbard_mpo(L, t, U)
    product = init_mps(Float64, L, "product")
    @test expected(H, product) ≈ 0. atol=1e-15
    GHZ = init_mps(Float64, L, "GHZ")
    @test expected(H, GHZ) ≈ U/2*(L-1)
    W = init_mps(Float64, L, "W")
    @test expected(H, W) ≈ 2t*(L-1)/L
end

@testset "expectation value of squared Mps" begin
    L = 5
    t = 1.5
    U = 1.5
    H = init_hubbard_mpo(L, t, U)
    product = init_mps(Float64, L, "product")
    @test MPStates.norm_of_apply(H, product) ≈ 0. atol=1e-15
    GHZ = init_mps(Float64, L, "GHZ")
    @test MPStates.norm_of_apply(H, GHZ) ≈ U^2/2*(L-1)^2
    W = init_mps(Float64, L, "W")
    @test MPStates.norm_of_apply(H, W) ≈ t^2*(4L-6)/L
end

@testset "variance of Mpo" begin
    L = 5
    t = 1.5
    U = 1.5
    H = init_hubbard_mpo(L, t, U)
    product = init_mps(Float64, L, "product")
    @test m_variance(H, product) ≈ 0. atol=1e-15
    GHZ = init_mps(Float64, L, "GHZ")
    @test m_variance(H, GHZ) ≈ U^2/4*(L-1)^2
    W = init_mps(Float64, L, "W")
    @test m_variance(H, W) ≈ t^2*(4L-6)/L - (2t*(L-1)/L)^2
end

@testset "apply Mpo to Mps" begin
    L = 6
    t = 1.5
    U = 1.5
    J = zeros(L, L)
    J[1, 2] = 1.
    J[4, 5] = 1.
    V = zeros(L, L)
    Op = init_mpo(L, J, V, true)

    n_op = zeros(2, 2)
    n_op[2, 2] = 1.

    rtest1 = MPStates.init_test_mps("rtest1")
    apply!(Op, rtest1)
    MPStates.make_left_canonical!(rtest1, false)
    @test norm(rtest1) ≈ 4/9
    @test measure(rtest1, n_op, 1) ≈ 4/9
    @test measure(rtest1, n_op, 2) ≈ 0. atol=1e-15
    @test measure(rtest1, n_op, 3) ≈ 0. atol=1e-15
    @test measure(rtest1, n_op, 4) ≈ 4/9
    @test measure(rtest1, n_op, 5) ≈ 4/9*0.64
    @test measure(rtest1, n_op, 6) ≈ 4/9
    ctest2 = MPStates.init_test_mps("ctest2")
    Op = init_mpo(L, complex.(J), complex.(V), true)
    apply!(Op, ctest2)
    MPStates.make_left_canonical!(ctest2, false)
    @test norm(ctest2) ≈ 4/9
    @test measure(ctest2, n_op, 1) ≈ 4/9
    @test measure(ctest2, n_op, 2) ≈ 0. atol=1e-15
    @test measure(ctest2, n_op, 3) ≈ 4/9
    @test measure(ctest2, n_op, 4) ≈ 4/9
    @test measure(ctest2, n_op, 5) ≈ 4/9
    @test measure(ctest2, n_op, 6) ≈ 4/9*0.64
end
end # @testset "Operations with Mpo and Mps"
