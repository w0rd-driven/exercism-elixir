defmodule TakeANumberDeluxe do
  # Client API
  alias TakeANumberDeluxe.State
  use GenServer

  @spec start_link(keyword()) :: {:ok, pid()} | {:error, atom()}
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @spec report_state(pid()) :: State.t()
  def report_state(machine) do
    GenServer.call(machine, :report_state)
  end

  @spec queue_new_number(pid()) :: {:ok, integer()} | {:error, atom()}
  def queue_new_number(machine) do
    GenServer.call(machine, :queue_new_number)
  end

  @spec serve_next_queued_number(pid(), integer() | nil) :: {:ok, integer()} | {:error, atom()}
  def serve_next_queued_number(machine, priority_number \\ nil) do
    GenServer.call(machine, {:serve_next_queued_number, priority_number})
  end

  @spec reset_state(pid()) :: :ok
  def reset_state(machine) do
    GenServer.cast(machine, :reset_state)
  end

  # Server callbacks
  @impl GenServer
  def init(init_args) do
    timeout = Keyword.get(init_args, :auto_shutdown_timeout, :infinity)
    min_number = Keyword.get(init_args, :min_number)
    max_number = Keyword.get(init_args, :max_number)
    case State.new(min_number, max_number, timeout) do
      {:ok, state} -> {:ok, state, timeout}
      {:error, reason} -> {:stop, reason}
    end
  end

  @impl GenServer
  def handle_call(:report_state, _reply, %{auto_shutdown_timeout: timeout} = state) do
    {:reply, state, state, timeout}
  end

  @impl GenServer
  def handle_call(:queue_new_number, _reply, %{auto_shutdown_timeout: timeout} = state) do
    case State.queue_new_number(state) do
      {:ok, new_number, new_state} -> {:reply, {:ok, new_number}, new_state, timeout}
      {:error, error} -> {:reply, {:error, error}, state, timeout}
    end
  end

  @impl GenServer
  def handle_call({:serve_next_queued_number, priority_number}, _reply, %{auto_shutdown_timeout: timeout} = state) do
    case State.serve_next_queued_number(state, priority_number) do
      {:ok, next_number, new_state} -> {:reply, {:ok, next_number}, new_state, timeout}
      {:error, error} -> {:reply, {:error, error}, state, timeout}
    end
  end

  @impl GenServer
  def handle_cast(:reset_state, %{min_number: min_number, max_number: max_number, auto_shutdown_timeout: timeout} = _state) do
    case State.new(min_number, max_number, timeout) do
      {:ok, state} -> {:noreply, state, timeout}
    end
  end

  @impl GenServer
  def handle_info(:timeout, state) do
    {:stop, :normal, state}
  end

  @impl GenServer
  def handle_info(_, %{auto_shutdown_timeout: timeout} = state) do
    {:noreply, state, timeout}
  end
end
