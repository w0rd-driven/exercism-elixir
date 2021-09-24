defmodule GuessingGame do
  def compare(secret_number, guess) do
    cond do
      secret_number === guess -> "Correct"
    end
  end
end
