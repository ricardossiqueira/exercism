defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess) do
    if(guess == :no_guess) do
      "Make a guess"
    else
      cond do
        :math.pow(secret_number - guess, 2) == 1 -> "So close"
        secret_number < guess -> "Too high"
        secret_number > guess -> "Too low"
        true -> "Correct"
      end
    end
  end
end
