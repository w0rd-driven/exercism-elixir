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

  def before_noon?(datetime) do
    # Please implement the before_noon?/1 function
  end

  def return_date(checkout_datetime) do
    # Please implement the return_date/1 function
  end

  def days_late(planned_return_date, actual_return_datetime) do
    # Please implement the days_late/2 function
  end

  def monday?(datetime) do
    # Please implement the monday?/1 function
  end

  def calculate_late_fee(checkout, return, rate) do
    # Please implement the calculate_late_fee/3 function
  end
end
