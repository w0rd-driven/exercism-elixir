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
    diff = Date.diff(planned_return_date, actual_return_datetime)
    cond do
      diff > 0 -> 0
      diff < 0 -> -diff
      true -> diff
    end
  end

  def monday?(datetime) do
    # Please implement the monday?/1 function
  end

  def calculate_late_fee(checkout, return, rate) do
    # Please implement the calculate_late_fee/3 function
  end
end
