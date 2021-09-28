defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(0), do: ""
  def numeral(number) when number >= 40, do: "XL" <> numeral(number - 40)
  def numeral(number) when number >= 10, do: "X" <> numeral(number - 10)
  def numeral(number) when number >= 9, do: "IX" <> numeral(number - 9)
  def numeral(number) when number >= 5, do: "V" <> numeral(number - 5)
  def numeral(number) when number >= 4, do: "IV" <> numeral(number - 4)
  def numeral(number) when number >= 1, do: "I" <> numeral(number - 1)
end
