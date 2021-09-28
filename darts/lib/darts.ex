defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    distance = :math.sqrt(x*x + y*y)
    cond do
      true -> 0
    end
  end
end
