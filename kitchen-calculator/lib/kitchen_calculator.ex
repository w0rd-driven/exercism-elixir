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

  @spec from_milliliter(any, :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon) :: any
  def from_milliliter(volume_pair, unit) do
    convert_from_milliliter(volume_pair, unit)
  end

  defp convert_from_milliliter(volume_pair, :cup) do
    {:cup, get_volume(volume_pair) / 240}
  end

  defp convert_from_milliliter(volume_pair, :fluid_ounce) do
    {:fluid_ounce, get_volume(volume_pair) / 30}
  end

  defp convert_from_milliliter(volume_pair, :teaspoon) do
    {:teaspoon, get_volume(volume_pair) / 5}
  end

  defp convert_from_milliliter(volume_pair, :tablespoon) do
    {:tablespoon, get_volume(volume_pair) / 15}
  end

  defp convert_from_milliliter(volume_pair, :milliliter) do
    volume_pair
  end

  @spec convert(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, any}
          | {:tablespoon, number}
          | {:teaspoon, number},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) :: any
  def convert(volume_pair, unit) do
    milliliters = convert_to_milliliter(volume_pair)
    convert_from_milliliter(milliliters, unit)
  end
end
