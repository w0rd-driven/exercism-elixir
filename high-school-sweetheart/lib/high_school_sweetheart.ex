defmodule HighSchoolSweetheart do
  @spec first_letter(any) :: any
  def first_letter(name) do
    String.trim(name) |> String.first()
  end

  @spec initial(binary) :: binary
  def initial(name) do
    first_letter(name) <> "." |> String.upcase()
  end

  def initials(full_name) do
    # Please implement the initials/1 function
  end

  def pair(full_name1, full_name2) do
    #      ******       ******
    #    **      **   **      **
    #  **         ** **         **
    # **            *            **
    # **                         **
    # **     X. X.  +  X. X.     **
    #  **                       **
    #    **                   **
    #      **               **
    #        **           **
    #          **       **
    #            **   **
    #              ***
    #               *

    # Please implement the pair/2 function
  end
end
