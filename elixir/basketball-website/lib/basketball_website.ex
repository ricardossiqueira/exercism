defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    get_in_path(data, path)
  end

  def get_in_path(data, ""), do: data

  def get_in_path(data, path) do
    [h | t] = String.split(path, ".")
    get_in_path(data[h], Enum.join(t, "."))
  end
end
