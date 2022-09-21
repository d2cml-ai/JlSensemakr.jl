cd("C:/Users/Work/Documents/Work/d2cml-ai/JlSensemakr.jl");

using Test
using JlSensemakr
using CSV
using DataFrames
using GLM

include("../src/JlSensemakr.jl")

url = "https://raw.githubusercontent.com/nlapier2/PySensemakr/main/data/darfur.csv";
darfur = DataFrame(CSV.File(download(url)));
formula = @formula(peacefactor ~ directlyharmed + age + farmer_dar + herder_dar + pastvoted + hhsize_darfur + female + village);
fitted_model = lm(formula, darfur);
atol = 0.000001

@testset "JlSensemakr.jl" begin
    @test robustness_value(model = fitted_model, covariates = "directlyharmed") ≈ 0.138776 atol = atol
    @test robustness_value(model = fitted_model, covariates = "directlyharmed", q = 1/2) ≈ 0.072027 atol = atol = atol
    @test robustness_value(model = fitted_model, covariates = "directlyharmed", q = 1/2, alpha = 0.05)[1] ≈ 0.004563 atol = atol
    @test robustness_value(model = fitted_model, covariates = "directlyharmed") ≈ 
    @test robustness_value(model = fitted_model, covariates = "female") ≈
    @test robustness_value(t_statistic = 4.18445, dof = 783)[1] ≈ 0.004563 atol = atol
end

