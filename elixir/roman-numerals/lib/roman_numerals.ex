defmodule RomanNumerals do
  @conversions [
    {"M", 1000},
    {"CM", 900},
    {"D", 500},
    {"CD", 400},
    {"C", 100},
    {"XC", 90},
    {"L", 50},
    {"XL", 40},
    {"X", 10},
    {"IX", 9},
    {"V", 5},
    {"IV", 4},
    {"I", 1}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()

  # def numeral(0), do: ""

  def numeral(number) do
    {roman, arabic} = Enum.find(@conversions, fn {roman, arabic} -> number >= arabic end)
    roman <> numeral(number - arabic)

    # convert(number)
  end

  # defp convert(number = 0), do: ""

  # defp convert(number) when number >= 1000, do: "M" <> convert(number - 1000)

  # defp convert(number) when number >= 900, do: "CM" <> convert(number - 900)

  # defp convert(number) when number >= 500, do: "D" <> convert(number - 500)

  # defp convert(number) when number >= 400, do: "CD" <> convert(number - 400)

  # defp convert(number) when number >= 100, do: "C" <> convert(number - 100)

  # defp convert(number) when number >= 90, do: "XC" <> convert(number - 90)

  # defp convert(number) when number >= 50, do: "L" <> convert(number - 50)

  # defp convert(number) when number >= 40, do: "XL" <> convert(number - 40)

  # defp convert(number) when number >= 10, do: "X" <> convert(number - 10)

  # defp convert(number) when number >= 9, do: "IX" <> convert(number - 9)

  # defp convert(number) when number >= 5, do: "V" <> convert(number - 5)

  # defp convert(number) when number >= 4, do: "IV" <> convert(number - 4)

  # defp convert(number) when number <= 3, do: "I" <> convert(number - 1)
end
