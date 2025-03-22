module API
using HTTP, JSON

export get_data


"""
    get_data(endpoint::String)
Realiza uma requisição GET à API do BCB e retorna os dados em formato JSON.
"""
function get_data(endpoint::String)
    url = "https://api.bcb.gov.br/" * endpoint
    try
        response = HTTP.get(url)
        if response.status == 200
            return JSON.parse(String(response.body))
        else
            error("Erro na requisição: Status $(response.status)")
        end
    catch e
        error("Falha ao acessar a API: $e")
    end
end

end # module