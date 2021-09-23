defmodule Lasagna do
  @spec expected_minutes_in_oven :: 40
  def expected_minutes_in_oven do
    40
  end

  @spec remaining_minutes_in_oven(number) :: number
  def remaining_minutes_in_oven(actual) do
    expected_minutes_in_oven() - actual
  end

  # TODO: define the 'preparation_time_in_minutes/1' function

  # TODO: define the 'total_time_in_minutes/2' function

  # TODO: define the 'alarm/0' function
end
