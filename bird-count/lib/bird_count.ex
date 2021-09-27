defmodule BirdCount do
  @spec today(maybe_improper_list) :: any
  def today([]) do
    nil
  end

  def today(list) do
    [head | _tail] = list
    head
  end

  def increment_day_count(list) do
    # Please implement the increment_day_count/1 function
  end

  def has_day_without_birds?(list) do
    # Please implement the has_day_without_birds?/1 function
  end

  def total(list) do
    # Please implement the total/1 function
  end

  def busy_days(list) do
    # Please implement the busy_days/1 function
  end
end
