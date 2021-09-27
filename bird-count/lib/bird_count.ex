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

  @spec busy_days(list) :: non_neg_integer
  def busy_days([]) do
    0
  end

  def busy_days(list) do
    [head | tail] = list
    if head >= 5 do
      1 + busy_days(tail)
    else
      busy_days(tail)
    end
  end
end
