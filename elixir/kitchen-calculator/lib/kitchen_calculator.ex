defmodule KitchenCalculator do
  @conversions [
    {:milliliter, 1},
    {:cup, 240},
    {:fluid_ounce, 30},
    {:teaspoon, 5},
    {:tablespoon, 15}
  ]

  def get_volume({_, vol}), do: vol
  def get_unit({unit, _}), do: unit

  # def to_milliliter({inc_unit, inc_vol}) do
  #   {_, vol} = Enum.find(@conversions, fn {unit, _} -> inc_unit == unit end)
  #   {:milliliter, vol * inc_vol}
  # end

  def to_milliliter(volume_pair) do
    {:milliliter,
     get_volume(volume_pair) *
       get_volume(Enum.find(@conversions, &(get_unit(&1) == get_unit(volume_pair))))}
  end

  # def from_milliliter({_, conv_vol}, inc_unit) do
  #   {_, vol} = Enum.find(@conversions, fn {unit, _} -> inc_unit == unit end)
  #   {inc_unit, conv_vol / vol}
  # end

  def from_milliliter(volume_pair, unit) do
    {unit,
     get_volume(volume_pair) /
       get_volume(Enum.find(@conversions, &(get_unit(&1) == unit)))}
  end

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
