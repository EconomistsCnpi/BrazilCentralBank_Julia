# BrazilCentralBank_Julia

**BrazilCentralBank_Julia** is a Julia package designed to simplify access to and manipulation of economic 
data from the [Banco Central do Brasil (BCB)](https://www.bcb.gov.br/). Built for economists, 
data analysts, and developers, this package leverages Julia’s high-performance capabilities 
to fetch, process, and analyze time series data directly from the BCB’s public API. Whether 
you’re tracking inflation (e.g., IPCA), interest rates (e.g., Selic), or exchange rates,
 `BrazilCentralBank_Julia` provides an intuitive and efficient solution for economic research and policy analysis.

## Package Structure

The `BrazilCentralBank_Julia` package is modular and well-organized to ensure maintainability and scalability. 
Below is the directory structure:


- **`Project.toml`**: Defines the package name, version, dependencies, and metadata for reproducibility.
- **`src/`**: Contains the source code:
  - **`api.jl`**: Manages HTTP requests to the BCB API.
  - **`BrazilCentralBank_Julia.jl`**: The main module that integrates all submodules.
  - **`series.jl`**: Functions for retrieving and manipulating time series data.
  - **`utils.jl`**: Utility functions (e.g., date formatting).
- **`README.md`**: This documentation file.

## Installation

To get started with `BrazilCentralBank_Julia`, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/EconomistsCNPI/BrazilCentralBank_Julia.git

1-cd BrazilCentralBank_Julia
2-Set Up the Julia Environment: Launch Julia in the terminal and run:
using Pkg
Pkg.activate(".")
Pkg.instantiate()

Usage
The core functionality of BrazilCentralBank_Julia revolves around retrieving economic time series data.
Below is an example of fetching the IPCA (Brazilian inflation index, code 433) for the year 2020:

using BrazilCentralBank_Julia, Dates

# Define parameters
series_code = 433  # IPCA
start_date = Date(2020, 1, 1)
end_date = Date(2020, 12, 31)

# Fetch the time series
data = BrazilCentralBank_Julia.get_series(series_code, start_date, end_date)

# Display the first 5 rows
println(first(data, 5))


Key Features
get_series(code::Int, start_date::Date, end_date::Date): Retrieves a time series as a DataFrame based on the BCB series code and date range.
format_date(date::Date): Formats dates into the dd/mm/yyyy string format, aligning with Brazilian conventions.
Dependencies
The package relies on the following Julia libraries:

HTTP: For making API requests.
JSON: For parsing API responses.
DataFrames: For structured data handling.
Dates: For date manipulation.


Example Use Case
As an economist, you might want to analyze the trend of the Selic rate during a specific policy period. 
With BrazilCentralBank_Julia, you can quickly fetch the data and integrate it with tools like Plots.jl for visualization
or GLM.jl for regression analysis.

using BrazilCentralBank_Julia, Dates, Plots

# Fetch Selic data (code 11)
selic_data = BrazilCentralBank_Julia.get_series(11, Date(2019, 1, 1), Date(2021, 12, 31))

# Plot the time series
plot(selic_data.data, selic_data.valor, title="Selic Rate (2019-2021)", label="Selic", lw=2)