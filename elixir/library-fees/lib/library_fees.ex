defmodule LibraryFees do
  @spec datetime_from_string(String.t()) :: NaiveDateTime
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  @spec before_noon?(NaiveDateTime) :: boolean()
  def before_noon?(datetime),
    do: if(Time.compare(datetime, ~T[12:00:00]) == :lt, do: true, else: false)

  @spec return_date(NaiveDateTime) :: Date
  def return_date(checkout_datetime),
    do:
      if(before_noon?(checkout_datetime),
        do: checkout_datetime |> NaiveDateTime.to_date() |> Date.add(28),
        else: checkout_datetime |> NaiveDateTime.to_date() |> Date.add(29)
      )

  @spec days_late(Date, NaiveDateTime) :: pos_integer()
  def days_late(planned_return_date, actual_return_datetime) do
    diff =
      Date.diff(
        NaiveDateTime.to_date(actual_return_datetime),
        planned_return_date
      )

    if diff < 0, do: 0, else: diff
  end

  @spec monday?(NaiveDateTime) :: boolean()
  def monday?(datetime) do
    date = NaiveDateTime.to_date(datetime)

    if Date.compare(date, Date.beginning_of_week(date)) == :eq,
      do: true,
      else: false
  end

  @spec calculate_late_fee(
          checkout :: String.t(),
          return :: String.t(),
          rate :: pos_integer()
        ) ::
          pos_integer()
  def calculate_late_fee(checkout, return, rate) do
    return = datetime_from_string(return)
    days_late = days_late(return_date(datetime_from_string(checkout)), return)

    fee = if days_late == 0, do: 0, else: days_late * rate
    if monday?(return), do: floor(fee * 0.5), else: fee
  end
end
