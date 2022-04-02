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

  def calculate_verbose(stack, operation) do
    # Please implement the calculate_verbose/2 function
  end
end
