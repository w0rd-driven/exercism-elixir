defmodule FreelancerRates do
  @spec daily_rate(number) :: float
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  @spec apply_discount(number, number) :: float
  def apply_discount(before_discount, discount) do
    percentage = discount / 100
    before_discount - before_discount * percentage
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
  end
end
