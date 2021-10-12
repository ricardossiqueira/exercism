defmodule Chessboard do
  @spec rank_range() :: Range
  def rank_range, do: 1..8

  @spec file_range() :: Range
  def file_range, do: ?A..?H

  @spec ranks() :: [pos_integer()]
  def ranks, do: Enum.to_list(rank_range())

  @spec files() :: [String.t()]
  def files, do: Enum.map(file_range(), &<<&1>>)
end
