defmodule LibraryFees do
  @spec datetime_from_string(binary) ::
          :incompatible_calendars
          | :invalid_date
          | :invalid_format
          | :invalid_time
          | NaiveDateTime.t()
  def datetime_from_string(string) do
    {_status, datetime} = NaiveDateTime.from_iso8601(string)
    datetime
  end

  @spec before_noon?(%{
          :calendar => any,
          :day => any,
          :hour => any,
          :microsecond => any,
          :minute => any,
          :month => any,
          :second => any,
          :year => any,
          optional(any) => any
        }) :: boolean
  def before_noon?(datetime) do
    noon = ~T[12:00:00]
    comparison = datetime
    |> NaiveDateTime.to_time()
    |> Time.compare(noon)
    case comparison do
      :lt -> true
      _ -> false
    end
  end

  @spec return_date(%{
          :calendar => atom,
          :day => any,
          :hour => any,
          :microsecond => {any, any},
          :minute => any,
          :month => any,
          :second => any,
          :year => any,
          optional(any) => any
        }) :: Date.t()
  def return_date(checkout_datetime) do
    days = if checkout_datetime |> before_noon?(), do: 28, else: 29
    seconds_in_day = 24 * 60 * 60
    checkout_datetime
    |> NaiveDateTime.add(days * seconds_in_day, :second)
    |> NaiveDateTime.to_date()
  end

  @spec days_late(
          %{:calendar => atom, :day => any, :month => any, :year => any, optional(any) => any},
          %{:calendar => atom, :day => any, :month => any, :year => any, optional(any) => any}
        ) :: integer
  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(actual_return_datetime, planned_return_date)
    cond do
      diff < 0 -> 0
      true -> diff
    end
  end

  @spec monday?(%{
          :calendar => atom,
          :day => any,
          :month => any,
          :year => any,
          optional(any) => any
        }) :: boolean
  def monday?(datetime) do
    day = Date.day_of_week(datetime)
    cond do
      day == 1 -> true
      true -> false
    end
  end

  @spec calculate_late_fee(String.t(), String.t(), number) :: integer
  def calculate_late_fee(checkout, return, rate) do
    checkout_date = datetime_from_string(checkout)
    return_date = datetime_from_string(return)
    discount = if monday?(return_date), do: 0.5, else: 1

    days_late(return_date(checkout_date), return_date) * rate * discount
    |> floor()
  end
end
