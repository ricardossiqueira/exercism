# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []), do: Agent.start_link(fn -> [] end, opts)

  def list_registrations(pid), do: Agent.get(pid, & &1)

  def register(pid, register_to),
    do:
      Agent.get_and_update(
        pid,
        fn plots ->
          plot = %Plot{plot_id: pid, registered_to: register_to}
          {plot, [plot | plots]}
        end
      )

  def release(pid, plot_id),
    do: Agent.cast(pid, &Enum.reject(&1, fn %{plot_id: val} -> val == plot_id end))

  def get_registration(pid, plot_id),
    do:
      Enum.find(
        Agent.get(pid, & &1),
        {:not_found, "plot is unregistered"},
        fn %{plot_id: val} ->
          val == plot_id
        end
      )
end
