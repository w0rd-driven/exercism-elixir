defmodule Secrets do
  @spec secret_add(any) :: (number -> number)
  def secret_add(secret) do
    fn x ->
      x + secret
    end
  end

  @spec secret_subtract(any) :: (number -> number)
  def secret_subtract(secret) do
    fn x ->
      x - secret
    end
  end

  @spec secret_multiply(any) :: (number -> number)
  def secret_multiply(secret) do
    fn x ->
      x * secret
    end
  end

  @spec secret_divide(any) :: (integer -> integer)
  def secret_divide(secret) do
    fn x ->
      div(x, secret)
    end
  end

  @spec secret_and(any) :: (integer -> integer)
  def secret_and(secret) do
    fn x ->
      Bitwise.&&&(x, secret)
    end
  end

  @spec secret_xor(any) :: (integer -> integer)
  def secret_xor(secret) do
    fn x ->
      Bitwise.bxor(x, secret)
    end
  end

  @spec secret_combine(any, any) :: (any -> any)
  def secret_combine(secret_function1, secret_function2) do
    fn x ->
      x
      |> secret_function1.()
      |> secret_function2.()
    end
  end
end
