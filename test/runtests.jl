using Test
using JlSensemakr
using CSV
using DataFrames
using GLM

@testset "JlSensemakr.jl" begin
    # set up data
    url = "https://raw.githubusercontent.com/nlapier2/PySensemakr/main/data/darfur.csv";
    darfur = DataFrame(CSV.File(download(url)));
    formula = @formula(peacefactor ~ directlyharmed + age + farmer_dar + herder_dar + pastvoted + hhsize_darfur + female + village);
    fitted_model = lm(formula, darfur);
    atol = 0.000001

    #tests
    @test robustness_value(model = fitted_model, covariates = "directlyharmed")[1] ≈ 0.138776 atol = atol
    @test robustness_value(model = fitted_model, covariates = "directlyharmed", q = 1/2)[1] ≈ 0.072027 atol = atol = atol
    @test robustness_value(model = fitted_model, covariates = "directlyharmed", q = 1/2, alpha = 0.05)[1] ≈ 0.004563 atol = atol
    @test robustness_value(t_statistic = 4.18445, dof = 783)[1] ≈ 0.138776 atol = atol
    @test partial_r2(model = fitted_model, covariates = "directlyharmed")[1] ≈ 0.021873093341109
    @test partial_r2(model = fitted_model, covariates = "female")[1] ≈ 0.10903391542784427
    @test partial_r2(t_statistic = 4.18445, dof = 783)[1] ≈ 0.021873093496457607
    
end

