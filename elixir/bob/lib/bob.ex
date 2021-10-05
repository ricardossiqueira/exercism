defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) ->
        "Fine. Be that way!"

      yell_a_question?(input) ->
        "Calm down, I know what I'm doing!"

      question?(input) ->
        "Sure."

      yell?(input) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end

  defp silence?(phrase), do: String.trim(phrase) === ""

  defp yell_a_question?(phrase),
    do:
      String.last(phrase) === "?" && phrase === String.upcase(phrase) &&
        !String.match?(phrase, ~r/[0-9]/) && !String.match?(phrase, ~r/[:)]/)

  defp yell?(phrase),
    do: phrase === String.upcase(phrase) && !String.match?(phrase, ~r/[-,0-9]+$/)

  defp question?(phrase), do: String.last(String.trim(phrase)) === "?"
end
