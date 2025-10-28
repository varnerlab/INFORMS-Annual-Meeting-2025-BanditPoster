# setup paths -
const _ROOT = pwd();
const _PATH_TO_SRC = joinpath(_ROOT, "src");
const _PATH_TO_DATA = joinpath(_ROOT, "data");
const _PATH_TO_FIGS = joinpath(_ROOT, "figs");

# make sure all is up to date -
using Pkg
if (isfile(joinpath(_ROOT, "Manifest.toml")) == false) # have manifest file, we are good. Otherwise, we need to instantiate the environment
    Pkg.add(path="https://github.com/varnerlab/VLQuantitativeFinancePackage.jl.git")
    Pkg.activate("."); Pkg.resolve(); Pkg.instantiate(); Pkg.update();
end

# load external packages -
using VLQuantitativeFinancePackage
using DataFrames
using CSV
using Dates
using LinearAlgebra
using Statistics
using Plots
using Colors
using StatsPlots
using JLD2
using FileIO
using Distributions
using Distances
using MathOptInterface
using DataStructures
using PrettyTables
using StatsBase
using KernelFunctions
using HypothesisTests
using JuMP
using MadNLP
using NNlib

# load my codes -
include(joinpath(_PATH_TO_SRC, "Types.jl"));
include(joinpath(_PATH_TO_SRC, "Factory.jl"));
include(joinpath(_PATH_TO_SRC, "Solve.jl"));
include(joinpath(_PATH_TO_SRC, "Bandits.jl"));
include(joinpath(_PATH_TO_SRC, "Tables.jl"));