ENV["PYTHON"] = ""
ENV["GUROBI_HOME"] = "/usr"

atreplinit() do repl
    @eval using Base.Iterators
    @eval using LinearAlgebra
    @eval using Statistics
end
