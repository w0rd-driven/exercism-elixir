defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({operation, _, definition} = ast, accumulator)
      when operation in [:def, :defp] do
    {name, arguments} = get_function_name_and_arguments(definition)

    arity = length(arguments)
    message = String.slice(to_string(name), 0, arity)

    {ast, [message | accumulator]}
  end

  def decode_secret_message_part(ast, accumulator) do
    {ast, accumulator}
  end

  defp get_function_name_and_arguments(definition) do
    case definition do
      [{:when, _, arguments} | _] -> get_function_name_and_arguments(arguments)
      [{name, _, arguments} | _] when is_list(arguments) -> {name, arguments}
      [{name, _, arguments} | _] when is_atom(arguments) -> {name, []}
    end
  end

  def decode_secret_message(string) do
    ast = to_ast(string)
    {_, decoded} = Macro.prewalk(ast, [], &decode_secret_message_part/2)

    decoded
    |> Enum.reverse()
    |> Enum.join("")
  end
end
