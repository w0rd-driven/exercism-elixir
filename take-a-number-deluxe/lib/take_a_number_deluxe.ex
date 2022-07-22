defmodule TakeANumberDeluxe do
  # Client API
  use GenServer

  @spec start_link(keyword()) :: {:ok, pid()} | {:error, atom()}
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @spec report_state(pid()) :: TakeANumberDeluxe.State.t()
  def report_state(machine) do
    # Please implement the report_state/1 function
  end

  @spec queue_new_number(pid()) :: {:ok, integer()} | {:error, atom()}
  def queue_new_number(machine) do
    # Please implement the queue_new_number/1 function
  end

  @spec serve_next_queued_number(pid(), integer() | nil) :: {:ok, integer()} | {:error, atom()}
  def serve_next_queued_number(machine, priority_number \\ nil) do
    # Please implement the serve_next_queued_number/2 function
  end

  @spec reset_state(pid()) :: :ok
  def reset_state(machine) do
    # Please implement the reset_state/1 function
  end

  # Server callbacks
  @impl GenServer
  def init(init_args) do
    timeout = Keyword.get(init_args, :auto_shutdown_timeout, :infinity)
    min_number = Keyword.get(init_args, :min_number)
    max_number = Keyword.get(init_args, :max_number)
    case TakeANumberDeluxe.State.new(min_number, max_number, timeout) do
      {:ok, state} -> {:ok, state}
      {:error, reason} -> {:stop, reason}
    end
  end
end
