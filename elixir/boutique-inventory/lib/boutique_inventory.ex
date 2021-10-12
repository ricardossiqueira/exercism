defmodule BoutiqueInventory do
  def sort_by_price(inventory), do: Enum.sort_by(inventory, & &1[:price], :asc)

  def with_missing_price(inventory), do: Enum.filter(inventory, &(&1[:price] == nil))

  def increase_quantity(item, count),
    do:
      Map.update(
        item,
        :quantity_by_size,
        %{},
        &(&1
          |> Map.to_list()
          |> Enum.map(fn {k, v} -> {k, v + count} end)
          |> Enum.into(%{}))
      )

  def total_quantity(%{quantity_by_size: quantity_by_size}),
    do: quantity_by_size |> Map.values() |> Enum.sum()
end
