defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @conversions [
    {:mercury, 0.2408467},
    {:venus, 0.61519726},
    {:earth, 1},
    {:mars, 1.8808158},
    {:jupiter, 11.862615},
    {:saturn, 29.447498},
    {:uranus, 84.016846},
    {:neptune, 164.79132}
  ]

  @earth_year_in_sec 31_557_600

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    {_, ey} = Enum.find(@conversions, fn {pl, _} -> pl == planet end)
    seconds / (ey * @earth_year_in_sec)
  end
end
