defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    "#{first_line(number)}\n#{second_line(number)}\n"
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics() do
    lyrics(99..0)
  end

  def lyrics(_..up_to = range) do
    for number <- range, into: "", do: verse(number) <> "#{unless number === up_to, do: "\n"}"
  end

  @doc """
  Match first and second line possibilities for a single verse.
  """
  defp first_line(number) when number > 1,
    do: "#{number} bottles of beer on the wall, #{number} bottles of beer."

  defp first_line(number) when number > 0,
    do: "#{number} bottle of beer on the wall, #{number} bottle of beer."

  defp first_line(_), do: "No more bottles of beer on the wall, no more bottles of beer."

  defp second_line(number) when number > 2,
    do: "Take one down and pass it around, #{number - 1} bottles of beer on the wall."

  defp second_line(number) when number > 1,
    do: "Take one down and pass it around, #{number - 1} bottle of beer on the wall."

  defp second_line(number) when number > 0,
    do: "Take it down and pass it around, no more bottles of beer on the wall."

  defp second_line(_),
    do: "Go to the store and buy some more, 99 bottles of beer on the wall."
end
