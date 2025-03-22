module Series
using ..API, DataFrames, Dates

export get_series

"""
    get_series(code::Int, start_date::Date, end_date::Date)
Obtém uma série temporal do BCB pelo código, com datas inicial e final.
Retorna um DataFrame com colunas `data` e `valor`.
"""
function get_series(code::Int, start_date::Date, end_date::Date)
    # Formata as datas para o padrão da API (dd/mm/yyyy)
    start_str = Dates.format(start_date, "dd/mm/yyyy")
    end_str = Dates.format(end_date, "dd/mm/yyyy")

    # Constrói o endpoint da API
    endpoint = "dados/serie/bcdata.sgs.$code/dados?formato=json&dataInicial=$start_str&dataFinal=$end_str"

    # Obtém os dados
    data = API.get_data(endpoint)

    # Converte para DataFrame e ajusta tipos
    df = DataFrame(data)
    df[!, :data] = Date.(df[!, :data], "dd/mm/yyyy")
    df[!, :valor] = parse.(Float64, df[!, :valor])

    return df
end

end # module