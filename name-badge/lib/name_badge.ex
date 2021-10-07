defmodule NameBadge do
  @spec print(any, any, false | nil | String.t()) :: String.t()
  def print(id, name, department) do
    id_value = if id, do: "[#{id}] - ", else: ""
    department_value = if department, do: department |> String.upcase(), else: "OWNER"
    id_value <> "#{name} - " <> department_value
  end
end
