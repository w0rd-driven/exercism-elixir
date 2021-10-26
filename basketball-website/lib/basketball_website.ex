defmodule BasketballWebsite do
  @spec extract_from_path(any, String.t()) :: any
  def extract_from_path(data, path) do
    path_parts = String.split(path, ".")
    extract_data(data, path_parts)
  end

  defp extract_data(data, []), do: data
  defp extract_data(data, [head | tail]) do
    extract_data(data[head], tail)
  end

  @spec get_in_path(any, String.t()) :: any
  def get_in_path(data, path) do
    path_parts = String.split(path, ".")
    get_in(data, path_parts)
  end
end
