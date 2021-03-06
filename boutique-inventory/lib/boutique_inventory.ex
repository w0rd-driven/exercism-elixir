defmodule BoutiqueInventory do
  @spec sort_by_price(any) :: list
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price), :asc)
  end

  @spec with_missing_price(any) :: list
  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price == nil end)
  end

  @spec increase_quantity(%{:quantity_by_size => any, optional(any) => any}, any) :: %{
          :quantity_by_size => any,
          optional(any) => any
        }
  def increase_quantity(item, count) do
    quantity_by_size = item.quantity_by_size
    |> Enum.map(fn {key, value} -> {key, value + count} end)
    |> Enum.into(%{})
    Map.put(item, :quantity_by_size, quantity_by_size)
  end

  @spec total_quantity(atom | %{:quantity_by_size => any, optional(any) => any}) :: any
  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_key, value}, accumulator -> value + accumulator end)
  end
end
