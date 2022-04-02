defmodule RPNCalculator do

  @spec calculate!(any, (any -> any)) :: any
  def calculate!(stack, operation) do
    operation.(stack)
  end

  def calculate(stack, operation) do
    # Please implement the calculate/2 function
  end

  def calculate_verbose(stack, operation) do
    # Please implement the calculate_verbose/2 function
  end
end
