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
    rank_range() |> Enum.to_list()
  end

  def files do
    # Please implement the files/0 function
  end
end
