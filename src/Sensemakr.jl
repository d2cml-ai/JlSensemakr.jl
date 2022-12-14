module Sensemakr

export robustness_value, partial_r2, partial_f2, group_partial_r2, sensitivity_stats, adjusted_estimate, adjusted_se, adjusted_t, obv_bounds, ovb_contour_plot, Sensemakr, plot

using Distributions, DataFrames, GLM, StatsModels, PyPlot

include("Sensemakr_obj.jl")
include("sensitivity_statistics.jl")
include("bias_functions.jl")
include("sensitivity_bounds.jl")
include("sensitivity_plots.jl")

end
