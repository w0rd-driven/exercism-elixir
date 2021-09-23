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

  @spec monthly_rate(number, number) :: integer
  def monthly_rate(hourly_rate, discount) do
    monthly_rate = daily_rate(hourly_rate) * 22
    discounted_rate = apply_discount(monthly_rate, discount)
    trunc(discounted_rate)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
  end
end
