defmodule Chessboard do
  @spec rank_range :: Range.t()
  def rank_range do
    1..8
  end

  @spec file_range :: Range.t()
  def file_range do
    ?A..?H
  end

  @spec ranks :: list
  def ranks do
    rank_range()
    |> Enum.to_list()
  end

  @spec files :: [char()]
  def files do
    file_range()
    |> Enum.map(& <<&1>>)
  end
end
