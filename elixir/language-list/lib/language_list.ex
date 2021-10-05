defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove(list), do: List.delete_at(list, 0)

  def first([head | _]), do: head

  def count(list), do: length(list)

  def exciting_list?(list),
    do: Enum.find_value(list, false, &(&1 == "Elixir"))
end
