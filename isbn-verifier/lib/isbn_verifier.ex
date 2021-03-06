defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    isbn |> get_isbn_as_list
  end

  @spec get_isbn_as_list(String.t()) :: list
  defp get_isbn_as_list(isbn) do
    isbn |> String.replace("-", "", trim: true) |> String.graphemes
  end
end
