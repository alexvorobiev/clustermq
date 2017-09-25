context("qsys")

test_that("control flow", {
    fx = function(x) x*2
    result = Q(fx, x=1:3, n_jobs=1, qsys_id="multicore")
    expect_equal(result, as.list(1:3*2))
})

test_that("common data", {
    fx = function(x, y) x*2 + y
    result = Q(fx, x=1:3, const=list(y=10), n_jobs=1, qsys_id="multicore")
    expect_equal(result, as.list(1:3*2+10))
})

test_that("export", {
    fx = function(x) x*2 + z
    result = Q(fx, x=1:3, export=list(z=20), n_jobs=1, qsys_id="multicore")
    expect_equal(result, as.list(1:3*2+20))
})

test_that("seed reproducibility", {
    fx = function(x) sample(1:100, 1)
    r1 = Q(fx, x=1:3, n_jobs=1, qsys_id="multicore")
    r2 = Q(fx, x=1:3, n_jobs=1, qsys_id="multicore")
    expect_equal(r1, r2)
})
