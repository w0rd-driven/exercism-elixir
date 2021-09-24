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

  def first(list) do
    # Please implement the first/1 function
  end

  def count(list) do
    # Please implement the count/1 function
  end

  def exciting_list?(list) do
    # Please implement the exciting_list?/1 function
  end
end
