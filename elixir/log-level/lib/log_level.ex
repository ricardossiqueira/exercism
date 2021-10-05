defmodule LogLevel do
  def to_label(0, false), do: :trace
  def to_label(1, _), do: :debug
  def to_label(2, _), do: :info
  def to_label(3, _), do: :warning
  def to_label(4, _), do: :error
  def to_label(5, false), do: :fatal
  def to_label(_, _), do: :unknown

  def alert_recipient(level, legacy?) do
    cond do
      (level == 0 or level == 5) and legacy? -> :dev1
      level == 4 or level == 5 -> :ops
      (level < 0 or level > 5) and !legacy? -> :dev2
      level < 0 or level > 5 -> :dev1
      true -> nil
    end
  end
end
