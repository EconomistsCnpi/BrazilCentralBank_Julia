module Utils
using Dates

export format_date

"""
    format_date(date::Date)
Formata uma data no padrão dd/mm/yyyy.
"""
function format_date(date::Date)
    Dates.format(date, "dd/mm/yyyy")
end

end # module