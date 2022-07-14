# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start_link(fn -> %{plots: [], index: 0} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn %{plots: plots} -> plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{plots: plots, index: index} ->
      index = index + 1
      plot = %Plot{plot_id: index, registered_to: register_to}
      {plot, %{plots: [plot| plots], index: index}}
    end)
  end

  def release(pid, plot_id) do
    Agent.cast(pid, fn %{plots: plots} = state ->
      released = plots |> Enum.filter(fn %{plot_id: id} -> id != plot_id end)
      %{state | plots: released}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn %{plots: plots} ->
      plots |> Enum.find({:not_found, "plot is unregistered"}, fn %{plot_id: id} -> id == plot_id end)
    end)
  end
end
