defmodule TakeANumber do
  @spec start :: pid
  def start() do
    spawn(fn -> run(0) end)
  end

  defp run(state) do
    receive do
      {:report_state, sender} ->
        send(sender, state)
        run(state)
      {:take_a_number, sender} ->
        count = state + 1
        send(sender, count)
        run(count)
      :stop -> {}
      _msg -> run(state)
    end
  end
end
