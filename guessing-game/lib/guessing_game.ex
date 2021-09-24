defmodule GuessingGame do
  def compare(secret_number, guess) do
    cond do
      guess === secret_number -> "Correct"
      guess > secret_number -> "Too high"
      guess < secret_number -> "Too low"
    end
  end
end
