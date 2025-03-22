module JuliaBCB

include("api.jl")
include("series.jl")
include("utils.jl")

# Traz as exportações de Series para o escopo de JuliaBCB
using .Series

# Exporta get_series diretamente
export get_series

end # module