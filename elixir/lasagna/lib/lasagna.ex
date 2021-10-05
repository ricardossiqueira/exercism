defmodule Lasagna do
  @minutes_in_oven 40
  @layer_prepare_time 2

  def expected_minutes_in_oven(), do: @minutes_in_oven
  
  def remaining_minutes_in_oven(min), do: @minutes_in_oven - min

  def preparation_time_in_minutes(layers), do: @layer_prepare_time * layers

  def total_time_in_minutes(layers, min) do
    preparation_time_in_minutes(layers) + min
  end

  def alarm(),do: "Ding!"

end
