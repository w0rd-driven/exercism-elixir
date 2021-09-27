defmodule KitchenCalculator do
  @spec get_volume(tuple) :: any
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  @spec to_milliliter(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, number}
          | {:tablespoon, number}
          | {:teaspoon, number}
        ) :: {:milliliter, any}
  def to_milliliter(volume_pair) do
    convert_to_milliliter(volume_pair)
  end

  defp convert_to_milliliter({:cup, volume}) do
    {:milliliter, 240 * volume}
  end

  defp convert_to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, 30 * volume}
  end

  defp convert_to_milliliter({:teaspoon, volume}) do
    {:milliliter, 5 * volume}
  end

  defp convert_to_milliliter({:tablespoon, volume}) do
    {:milliliter, 15 * volume}
  end

  defp convert_to_milliliter({:milliliter, volume}) do
    {:milliliter, volume}
  end

  def from_milliliter(volume_pair, unit) do
    # Please implement the from_milliliter/2 functions
  end

  def convert(volume_pair, unit) do
    # Please implement the convert/2 function
  end
end
