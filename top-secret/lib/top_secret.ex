defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({operation, _, definition} = ast, acc) when operation in [:def, :defp] do
    {name, arguments} = get_function_name_and_arguments(definition)

    arity = length(arguments)
    message = String.slice(to_string(name), 0, arity)

    {ast, [message | acc]}
  end

  def decode_secret_message_part(ast, acc) do
    {ast, acc}
  end

  defp get_function_name_and_arguments(definition) do
    case definition do
      [{:when, _, arguments} | _] -> get_function_name_and_arguments(arguments)
      [{name, _, arguments} | _] when is_list(arguments) -> {name, arguments}
      [{name, _, arguments} | _] when is_atom(arguments) -> {name, []}
    end
  end

  def decode_secret_message(string) do
    # Please implement the decode_secret_message/1 function
  end
end
