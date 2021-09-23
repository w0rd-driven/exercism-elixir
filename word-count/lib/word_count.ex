defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.split(~r{[:!&@$%^&, _]}, trim: true)
    |> Enum.reduce(%{}, fn word, result ->
      Map.update(result, word, 1, fn item -> item + 1 end)
    end)
  end
end
