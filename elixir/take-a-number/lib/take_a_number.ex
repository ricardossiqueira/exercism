defmodule TakeANumber do
  def start() do
    spawn(__MODULE__, :loop, [0])
  end

  def loop(n) do
    receive do
      {:report_state, sender} ->
        send(sender, n)
        loop(n)

      {:take_a_number, sender} ->
        n = n + 1
        send(sender, n)
        loop(n)

      :stop ->
        exit(0)

      _ ->
        loop(n)
    end
  end
end
