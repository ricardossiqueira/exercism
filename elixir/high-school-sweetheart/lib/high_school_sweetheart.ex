defmodule HighSchoolSweetheart do
  def first_letter(name), do: name |> :string.trim() |> :string.slice(0, 1)

  def initial(name), do: name |> first_letter() |> :string.uppercase() |> Kernel.<>(".")

  def initials(full_name),
    do: full_name |> :string.split(" ") |> Enum.map(&initial(&1)) |> Enum.join(" ")

  def pair(full_name1, full_name2) do
    ascii = [
      "     ******       ******\n",
      "   **      **   **      **\n",
      " **         ** **         **\n",
      "**            *            **\n",
      "**                         **\n",
      "**     ",
      initials(full_name1),
      "  +  ",
      initials(full_name2),
      "     **\n",
      " **                       **\n",
      "   **                   **\n",
      "     **               **\n",
      "       **           **\n",
      "         **       **\n",
      "           **   **\n",
      "             ***\n",
      "              *\n"
    ]

    Enum.join(ascii, "")
  end
end
