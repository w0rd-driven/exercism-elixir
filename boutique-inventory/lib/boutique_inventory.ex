defmodule BoutiqueInventory do
  @spec sort_by_price(any) :: list
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price), :asc)
  end

  @spec with_missing_price(any) :: list
  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price == nil end)
  end

  def increase_quantity(item, count) do
    # Please implement the increase_quantity/2 function
  end

  def total_quantity(item) do
    # Please implement the total_quantity/1 function
  end
end
