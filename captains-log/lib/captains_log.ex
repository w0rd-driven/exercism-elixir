defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    @planetary_classes |> Enum.random()
  end

  def random_ship_registry_number() do
    # Please implement the random_ship_registry_number/0 function
  end

  def random_stardate() do
    # Please implement the random_stardate/0 function
  end

  def format_stardate(stardate) do
    # Please implement the format_stardate/1 function
  end
end