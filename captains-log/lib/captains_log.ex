defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    @planetary_classes |> Enum.random()
  end

  def random_ship_registry_number() do
    "NCC-#{1000 .. 9999 |> Enum.random()}"
  end

  def random_stardate() do
    year = 41_000 .. 42_000 |> Enum.random()
    date = :rand.uniform()
    year + date
    # :rand.uniform() * (42000.0 - 41000.0) + 41000.0
  end

  def format_stardate(stardate) do
    # Please implement the format_stardate/1 function
  end
end
