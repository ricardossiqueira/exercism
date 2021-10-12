defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base) do
    res =
      digits
      |> Enum.reverse()
      |> Enum.with_index()
      |> Enum.reduce([], fn {n, i}, acc -> [{Integer.mod(n, input_base), i} | acc] end)
      |> Enum.reduce([], fn {n, i}, acc -> [:math.pow(output_base, i) * n | acc] end)
      |> Enum.reverse()

    {:ok, res}
  end
end
