defmodule Allergies do
  use Bitwise

  @conversions [
    {1, ~w[eggs]},
    {2, ~w[peanuts]},
    {4, ~w[shellfish]},
    {8, ~w[strawberries]},
    {16, ~w[tomatoes]},
    {32, ~w[chocolate]},
    {64, ~w[pollen]},
    {128, ~w[cats]}
  ]

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags),
    do:
      Enum.reduce(@conversions, [], fn {code, word}, acc ->
        if (code &&& flags) != 0, do: acc ++ word, else: acc
      end)

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item), do: Enum.find(list(flags), &(&1 == item))
end
