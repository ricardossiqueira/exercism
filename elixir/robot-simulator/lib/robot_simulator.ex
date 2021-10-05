defmodule RobotSimulator do
  @invalid_direction {:error, "invalid direction"}
  @valid_directions [:north, :east, :south, :west]

  @invalid_position {:error, "invalid position"}

  @invalid_instruction {:error, "invalid instruction"}

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    cond do
      is_position_valid?(position) === false -> @invalid_position
      is_direction_valid?(direction) === false -> @invalid_direction
      true -> %{direction: direction, position: position}
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """

  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.graphemes()
    |> Enum.reduce(robot, &move(&2, &1))
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot), do: robot.direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot), do: robot.position

  # Validate directions input.
  defp is_direction_valid?(direction),
    do: Enum.any?(@valid_directions, &(&1 === direction))

  # Validate positions input.
  defp is_position_valid?({x, y}) when is_integer(x) and is_integer(y), do: true
  defp is_position_valid?(_), do: false

  # Moves the robot.
  defp move(%{position: {x, y}, direction: :north} = robot, "A"),
    do: %{robot | position: {x, y + 1}}

  defp move(%{position: {x, y}, direction: :south} = robot, "A"),
    do: %{robot | position: {x, y - 1}}

  defp move(%{position: {x, y}, direction: :east} = robot, "A"),
    do: %{robot | position: {x + 1, y}}

  defp move(%{position: {x, y}, direction: :west} = robot, "A"),
    do: %{robot | position: {x - 1, y}}

  defp move(%{direction: :north} = robot, "L"), do: %{robot | direction: :west}
  defp move(%{direction: :south} = robot, "L"), do: %{robot | direction: :east}
  defp move(%{direction: :east} = robot, "L"), do: %{robot | direction: :north}
  defp move(%{direction: :west} = robot, "L"), do: %{robot | direction: :south}

  defp move(%{direction: :north} = robot, "R"), do: %{robot | direction: :east}
  defp move(%{direction: :south} = robot, "R"), do: %{robot | direction: :west}
  defp move(%{direction: :east} = robot, "R"), do: %{robot | direction: :south}
  defp move(%{direction: :west} = robot, "R"), do: %{robot | direction: :north}

  # Validate instructions.
  defp move(_, _), do: @invalid_instruction
end
