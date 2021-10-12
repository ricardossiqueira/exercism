defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  @spec random_planet_class() :: String.t()
  def random_planet_class(), do: Enum.random(@planetary_classes)

  @spec random_planet_class() :: String.t()
  def random_ship_registry_number(),
    do: "NCC-" <> to_string(Enum.random(1_000..9_999))

  @spec random_stardate() :: float()
  def random_stardate(), do: :rand.uniform() * 1000 + 41_000

  @spec format_stardate(float()) :: String.t()
  def format_stardate(stardate),
    do: to_string(:io_lib.format("~.1f", [stardate]))
end
