defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from(erl_struct),
    do:
      erl_struct
      |> NaiveDateTime.from_erl!()
      |> NaiveDateTime.add(1_000_000_000)
      |> NaiveDateTime.to_erl()
end
