defmodule Rules do
  @spec eat_ghost?(any, any) :: any
  def eat_ghost?(power_pellet_active, touching_ghost) do
    power_pellet_active && touching_ghost
  end

  @spec score?(any, any) :: any
  def score?(touching_power_pellet, touching_dot) do
    touching_power_pellet || touching_dot
  end

  def lose?(power_pellet_active, touching_ghost) do
    # Please implement the lose?/2 function
  end

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    # Please implement the win?/3 function
  end
end
