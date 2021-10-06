defmodule HighScore do
  def new() do
    %{}
  end

  @spec add_player(map, any, any) :: map
  def add_player(scores, name, score \\ 0) do
    Map.put(scores, name, score)
  end

  @spec remove_player(map, any) :: map
  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  @spec reset_score(map, any) :: map
  def reset_score(scores, name) do
    Map.put(scores, name, 0)
  end

  @spec update_score(map, any, any) :: map
  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn current_value ->
      current_value + score
    end)
  end

  def get_players(scores) do
    # Please implement the get_players/1 function
  end
end
