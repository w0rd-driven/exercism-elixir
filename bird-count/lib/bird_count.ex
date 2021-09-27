defmodule BirdCount do
  @spec today(maybe_improper_list) :: any
  def today([]) do
    nil
  end

  def today(list) do
    [head | _tail] = list
    head
  end

  @spec increment_day_count(maybe_improper_list) :: nonempty_maybe_improper_list
  def increment_day_count([]) do
    [1]
  end

  def increment_day_count(list) do
    [head | tail] = list
    [head + 1 | tail]
  end

  @spec has_day_without_birds?(maybe_improper_list) :: boolean
  def has_day_without_birds?([]) do
    false
  end

  def has_day_without_birds?(list) do
    [head | tail] = list
    if head == 0 do
      true
    else
      has_day_without_birds?(tail)
    end
  end

  @spec total([number]) :: number
  def total([]) do
    0
  end

  def total(list) do
    [head | tail] = list
    head + total(tail)
  end

  def busy_days(list) do
    # Please implement the busy_days/1 function
  end
end
