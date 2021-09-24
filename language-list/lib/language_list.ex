defmodule LanguageList do
  @spec new :: []
  def new() do
    []
  end

  @spec add(any, any) :: nonempty_maybe_improper_list
  def add(list, language) do
    [ language | list ]
  end

  @spec remove(nonempty_maybe_improper_list) :: any
  def remove(list) do
    [_head | tail] = list
    tail
  end

  @spec first(nonempty_maybe_improper_list) :: any
  def first(list) do
    [head | _tail] = list
    head
  end

  @spec count(list) :: non_neg_integer
  def count(list) do
    list |> length
  end

  @spec exciting_list?(nonempty_maybe_improper_list) :: boolean
  def exciting_list?(list) do
    "Elixir" in list
  end
end
