defmodule RPNCalculator do
  @spec calculate!(any, (any -> any)) :: any
  def calculate!(stack, operation) do
    operation.(stack)
  end

  @spec calculate(any, any) :: :error | {:ok, any}
  def calculate(stack, operation) do
    try do
      {:ok, calculate!(stack, operation)}
    rescue
      _ -> :error
    end
  end

  @spec calculate_verbose(any, any) :: {:error, String.t()} | {:ok, any}
  def calculate_verbose(stack, operation) do
    try do
      {:ok, calculate!(stack, operation)}
    rescue
      _error -> {:error, "test error"}
    end
  end
end
