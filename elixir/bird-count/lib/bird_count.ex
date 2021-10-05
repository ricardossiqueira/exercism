defmodule BirdCount do
  def today([]), do: nil
  def today([h | _]), do: h

  def increment_day_count([]), do: [1]
  def increment_day_count([h | t]), do: [h + 1 | t]

  # Without recursion
  # def has_day_without_birds?(list),
  #   do: if(Enum.find(list, false, &(&1 == 0)), do: true, else: false)

  # Recursive
  def has_day_without_birds?([h | _]) when h == 0, do: true
  def has_day_without_birds?([_ | t]), do: has_day_without_birds?(t)
  def has_day_without_birds?([]), do: false

  # Recursive
  def total(list, sum \\ 0)
  def total([h | t], sum), do: total(t, sum + h)
  def total([], sum), do: sum

  # Recursive
  def busy_days(list, count \\ 0)
  def busy_days([h | t], count) when h >= 5, do: busy_days(t, count + 1)
  def busy_days([h | t], count), do: busy_days(t, count)
  def busy_days([], count), do: count
end
